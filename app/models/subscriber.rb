class Subscriber
  include Mongoid::Document
  include Mongoid::Timestamps

  field :first_name, type: String
  field :last_name, type: String
  field :email, type: String
  field :mobile, type: String
  field :address, type: String
  field :postcode, type: String
  field :deal_id, type: Integer
  field :order_card, type: Boolean, default: true

  belongs_to :deal

  validates_format_of :email,:with => Devise::email_regexp 

  validates_presence_of :first_name, :last_name, :email, :address, :postcode

  # TODO: voucher scoped?
  validates_uniqueness_of :email

  #attr_accessible :first_name, :last_name, :email, :mobile, :address, :postcode, :deal_id, :order_card

  scope :newest, ->{ desc(:created_at) }
end
