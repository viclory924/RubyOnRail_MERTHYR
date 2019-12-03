class BusinessCategoryTemplateImage
  include Mongoid::Document

  field :image, type: String
  field :business_category_template_id, type: Integer

  belongs_to :business_category_template

  #attr_accessible :image, :remove_image, :business_category_template_id

end
