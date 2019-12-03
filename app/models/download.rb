class Download
  include Mongoid::Document
  include Mongoid::Timestamps

  field :title, type: String
  field :category, type: String

  validates_presence_of :title, :file

  #attr_accessible :title, :file, :remove_file, :type, :category

  mount_uploader :file, DownloadUploader

  scope :newest, -> { desc(:created_at) }
end
