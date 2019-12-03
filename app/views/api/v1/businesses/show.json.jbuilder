json.name                 @business.name
json.category             @business.category
json.contact              @business.contact
json.address              @business.address
json.town                 @business.town
json.postcode             @business.postcode
json.telephone            @business.telephone
json.website              @business.website
json.email                @business.email
json.twitter              @business.twitter
json.facebook             @business.facebook
json.services             @business.services
json.profile              @business.profile
json.photo                @business.photo.url(:small_thumb)
json.coordinates          @business.coordinates
json.zone                 @business.zone
Business::DAYS.each do |d|
  opening_at = @business.send("#{d}_opening")
  closing_at = @business.send("#{d}_opening")
  if opening_at == 'closed' || closing_at == 'closed'
    json.set!(d, "Closed")
  else
    json.set!(d, "#{opening_at} - #{closing_at}")
  end
end
