class DownloadsController < ApplicationController
  PER_PAGE = 20

  load_and_authorize_resource

  layout 'new_admin'

  def index
    @downloads = Download.newest.page(params[:page]).per(PER_PAGE)

    respond_to do |format|
      #format.html # index.html.erb
      format.html { render layout: 'new_admin' } # index.html.erb
      format.json { render json: @downloads }
    end
  end

  def show
    respond_to do |format|
      #format.html # show.html.erb
      format.html { render layout: 'new_admin' }
      format.json { render json: @download }
    end
  end

  def new
    respond_to do |format|
      #format.html # new.html.erb
      format.html { render layout: 'new_admin' }
      format.json { render json: @download }
    end
  end

  def edit

  end

  def create
    respond_to do |format|
      if @download.save
        format.html { redirect_to @download, notice: 'Download was successfully created.' }
        format.json { render json: @download, status: :created, location: @download }
      else
        format.html { render action: "new" }
        format.json { render json: @download.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    respond_to do |format|
      if @download.update_attributes(download_params)
        format.html { redirect_to @download, notice: 'Download was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @download.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @download.destroy

    respond_to do |format|
      format.html { redirect_to downloads_url }
      format.json { head :no_content }
    end
  end

  private

  def download_params
    params.require(:download).permit(:title, :file, :remove_file, :type, :category)
  end
end
