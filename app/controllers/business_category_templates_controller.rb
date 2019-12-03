class BusinessCategoryTemplatesController < ApplicationController
  PER_PAGE = 20

  load_and_authorize_resource

  layout 'new_admin'

  def index
    @business_category_templates = BusinessCategoryTemplate.page(params[:page]).per(PER_PAGE)

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @business_category_templates }
    end
  end

  def show
    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @business_category_template }
    end
  end

  def new
    @business_category_template.business_category_template_images.build

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @business_category_template }
    end
  end

  def create
    respond_to do |format|
      if @business_category_template.save
        format.html { redirect_to @business_category_template, notice: 'Business category template was successfully created.' }
        format.json { render json: @business_category_template, status: :created, location: @business_category_template }
      else
        format.html { render action: "new" }
        format.json { render json: @business_category_template.errors, status: :unprocessable_entity }
      end
    end
  end

  def edit
    @business_category_template.business_category_template_images.build
  end

  def update
    respond_to do |format|
      if @business_category_template.update_attributes(business_category_template_params)
        format.html { redirect_to @business_category_template, notice: 'Business category template was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @business_category_template.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @business_category_template.destroy

    respond_to do |format|
      format.html { redirect_to business_category_templates_url }
      format.json { head :no_content }
    end
  end

  private

  def business_category_template_params
    params.require(:business_category_template).permit(:category, :body, :business_category_template_images_attributes)
  end
end
