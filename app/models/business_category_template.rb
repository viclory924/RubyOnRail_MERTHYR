class BusinessCategoryTemplate
  include Mongoid::Document

  field :category, type: String
  field :body, type: String

  has_many :business_category_template_images

  #attr_accessible :category, :body, :business_category_template_images_attributes

  validates_presence_of :category, :body#, :business_category_template_images
  validates_uniqueness_of :category

  accepts_nested_attributes_for :business_category_template_images
end
