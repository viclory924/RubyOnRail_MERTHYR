class DeletedRecord
  include Mongoid::Document
  include Mongoid::Timestamps

  field :record_type, type: String
  field :record_id, type: String
end
