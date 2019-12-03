class PageTemplate
  include Mongoid::Document
  include Mongoid::Slug
  include Mongoid::Timestamps

  LAYOUT_NAMES = %w(application with_sidebar with_download_links)

  field :title, type: String
  field :body, type: String
  field :layout_name, type: String, default: LAYOUT_NAMES[0]

  slug :title

  has_many :pages, inverse_of: :page_template

  validates_presence_of :title

  #attr_accessible :title, :body, :layout_name

  scope :newest, ->{ desc(:created_at) }
end
