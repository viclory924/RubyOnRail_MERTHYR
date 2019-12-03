class Post
  include Mongoid::Document
  include Mongoid::Slug
  include Mongoid::Timestamps


  STATUSES = %w(draft published)
  CATEGORIES = ['News', 'Shopping', 'Hints and Tips', 'Bit of a Laugh', 'Events', 'Offers']

  field :title, type: String
  field :body, type: String
  field :status, type: String, default: STATUSES[0]
  field :published_at, type: DateTime
  field :category, type: String
  field :image_mode, type: String, default: IMAGE_MODES[0]

  slug :title

  validates_presence_of :title
  validates_inclusion_of :status, in: STATUSES

  before_save :set_published_at, if: ->{ status_changed? && status == STATUSES[1] }

  #attr_accessible :title, :body, :status, :published_at, :image,
  #                :remove_image, :category, :image_mode

  mount_uploader :image, PostImageUploader

  scope :published, -> { Post.where(status: 'published').desc(:published_at) }
  scope :latest, ->(limit) { Post.published.limit(limit) }
  scope :newest, -> { desc(:created_at) }

  def published?
    status == STATUSES[1]
  end

private

  def set_published_at
    self.published_at = Time.zone.now
  end
end
