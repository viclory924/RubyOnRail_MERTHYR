class PageTemplatesController < ApplicationController
  PER_PAGE = 20

  load_and_authorize_resource

  layout 'new_admin'

  def index
    @page_templates = PageTemplate.newest.page(params[:page]).per(PER_PAGE)

    respond_to do |format|
      #format.html # index.html.erb
      format.html { render layout: 'new_admin' } # index.html.erb
      format.json { render json: @page_templates }
    end
  end

  def show
    respond_to do |format|
      # format.html # show.html.erb
      format.html { render layout: 'new_admin' }
      format.json { render json: @page_template }
    end
  end

  def new
    respond_to do |format|
      # format.html # new.html.erb
      format.html { render layout: 'new_admin' }
      format.json { render json: @page_template }
    end
  end

  def create
    respond_to do |format|
      if @page_template.save
        format.html { redirect_to @page_template, notice: 'Page template was successfully created.' }
        format.json { render json: @page_template, status: :created, location: @page_template }
      else
        format.html { render action: "new" }
        format.json { render json: @page_template.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    respond_to do |format|
      if @page_template.update_attributes(page_template_params)
        format.html { redirect_to @page_template, notice: 'Page template was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @page_template.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @page_template.destroy

    respond_to do |format|
      format.html { redirect_to page_templates_url }
      format.json { head :no_content }
    end
  end

  private

  def page_template_params
    params.require(:page_template).permit(:title, :body, :layout_name)
  end
end
