class DealsController < ApplicationController
  PER_PAGE = 20

  load_and_authorize_resource

  layout 'new_admin'

  def index
    @deals = Deal.newest.page(params[:page]).per(PER_PAGE)

    respond_to do |format|
      #format.html # index.html.erb
      format.html { render layout: 'new_admin' } # index.html.erb
      format.json { render json: @deals }
    end
  end

  def show
    respond_to do |format|
      # format.html # show.html.erb
      format.html { render layout: 'new_admin' }
      format.json { render json: @deal }
    end
  end

  def new
    @business_id = Business.find(params[:business_id]).id if params[:business_id]

    respond_to do |format|
      format.html { render layout: 'new_admin' }
      #format.html # new.html.erb
      format.json { render json: @deal }
    end
  end

  def edit
    @business_id = @deal.business.id
  end

  def create
    @business_id = Business.find(params[:deal][:business_id]).id if params[:deal][:business_id]

    respond_to do |format|
      if @deal.save
        Notifier.new_deal_created(@deal).deliver
        send_to_pushwoosh(@deal)

        format.html { redirect_to @deal, notice: 'Deal was successfully created.' }
        format.json { render json: @deal, status: :created, location: @deal }
      else
        format.html { render action: "new" }
        format.json { render json: @deal.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    @business_id = Business.find(params[:deal][:business_id]).id if params[:deal][:business_id]

    respond_to do |format|
      if @deal.update_attributes(deal_params)
        send_to_pushwoosh(@deal)

        format.html { redirect_to @deal, notice: 'Deal was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @deal.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @deal.destroy

    respond_to do |format|
      format.html { redirect_to deals_url, notice: 'Deal was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private

  def deal_params
    params.require(:deal).permit(:title, :start_date, :end_date, :status, :business_id,
      :image, :remove_image, :terms, :description)
  end

  def send_to_pushwoosh(deal)
    if !deal.unapproved? && !deal.notified?
      options = {
        notifications: [
          {
            content: deal.description,
          }
        ]
      };

      Pushwoosh.notify_all(deal.title, options)
      deal.update_attribute(:notified_at, Time.now)
    end
  end
end
