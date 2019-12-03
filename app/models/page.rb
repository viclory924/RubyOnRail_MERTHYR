class Page
  include Mongoid::Document
  include Mongoid::Slug
  include Mongoid::Timestamps

  STATUSES = %w(draft published)

  field :title, type: String
  field :body, type: String
  field :status, type: String, default: STATUSES[0]

  slug :title

  belongs_to :parent, class_name: 'Page', foreign_key: 'parent_id', inverse_of: :page
  has_many :children, class_name: 'Page', inverse_of: :page
  belongs_to :page_template, inverse_of: :page

  validates_presence_of :title
  validates_inclusion_of :status, in: STATUSES

  #attr_accessible :title, :body, :page_template_id, :status, :parent_id

  scope :newest, -> { desc(:created_at) }
end
