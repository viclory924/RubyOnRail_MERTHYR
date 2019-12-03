json.deals @deals do |deal|
  json.id                   deal.id
  json._id                  deal.id
  json.title                deal.title
  json.description          deal.description
  json.business             deal.business_name
  json.start_date           deal.start_date
  json.end_date             deal.end_date
  json.terms                deal.terms
  json.image                deal.image.url(:thumb)
  json.updated_at           deal.updated_at
end
json.current_time    Time.now.utc
