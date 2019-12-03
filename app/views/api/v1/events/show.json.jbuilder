json.id                  @event.id
json.name                @event.name
json.description         @event.description
json.location_name       @event.location_name
json.location_address    @event.location_address
json.coordinates         @event.coordinates
json.next_start          @event.next_start_and_end[0]
json.next_end            @event.next_start_and_end[1]
json.duration            @event.duration
json.date_info           render_date(@event)
json.small_image         @event.image.url("#{@event.image_mode}_small_thumb")
json.big_image           @event.image.url("#{@event.image_mode}_big_thumb")
json.updated_at          @event.updated_at
