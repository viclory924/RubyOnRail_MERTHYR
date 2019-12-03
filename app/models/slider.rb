class Slider
  include Mongoid::Document
  include Mongoid::Timestamps

  field :header, type: String
  field :caption, type: String
  field :button_title, type: String
  field :order, type: Integer
  field :url, type: String
  field :visible, type: Boolean, default: true

  validates_presence_of :image

  #attr_accessible :image, :caption, :order, :remove_image, :url, :visible

  mount_uploader :image, SliderImageUploader

  scope :newest, ->{ desc(:created_at) }
  scope :visible, ->{ where(:visible.ne => false) }
  scope :ordered, ->{ asc(:order) }
end
