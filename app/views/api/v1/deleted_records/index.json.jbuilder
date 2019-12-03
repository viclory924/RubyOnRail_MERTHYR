json.deleted_records @deleted_records do |record|
  json.record_id                record.record_id
  json.record_type              record.record_type
end
json.current_time    Time.now.utc
