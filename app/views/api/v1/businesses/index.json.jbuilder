json.businesses @businesses do |business|
  json.id                   business.id
  json._id                  business.id
  json.name                 business.name
  json.category             business.category
  json.contact              business.contact
  json.address              business.address
  json.town                 business.town
  json.postcode             business.postcode
  json.telephone            business.telephone
  json.website              business.website
  json.email                business.email
  json.twitter              business.twitter
  json.facebook             business.facebook
  json.services             business.services
  json.profile              business.profile
  json.photo                business.photo.url(:thumb_600_)
  json.latitude             business.lat
  json.longitude            business.lon
  json.zone                 business.zone
  json.updated_at           business.updated_at
  Business::DAYS.each do |d|
    opening_at = business.send("#{d}_opening")
    closing_at = business.send("#{d}_closing")
    if opening_at == 'closed' || closing_at == 'closed'
      json.set!(d, "Closed")
    else
      json.set!(d, "#{opening_at} - #{closing_at}")
    end
  end
end
json.current_time    Time.now.utc
