class Api::V1::EventsController < Api::BaseController

  ##
  # Returns all sheduled events.
  #
  # GET /api/v1/events
  #
  # params:
  #   header - API Version
  #
  # = Examples
  #
  #   curl -H "accept: application/vnd.welovemerthyr+json;version=1" http://localhost:5000/api/events
  #
  #   resp.status
  #   => 200
  #
  #   resp.body
  #   [{"id":"54f730e2f961bf93e9000001","name":"Global Village Festival","location_name":"Penderyn Square","image":"/uploads/event/image/54f730e2f961bf93e9000001/landscape_small_thumb_Global_Village.JPG","duration":21600},{...}]
  def index
    since     = params[:since]
    @events = Event.where(:next_occurrence.gte => Time.now).asc(:next_occurrence)
    @events = @events.where(:updated_at.gte => Time.parse(since)) if since.present?
    respond_with @events
  end

  ##
  # Returns the event for the given event id
  #
  # GET /api/v1/events/564c57c8663849b587000001
  #
  # params:
  #   header - API Version
  #
  # = Examples
  #
  #   curl -H "accept: application/vnd.welovemerthyr+json;version=1" http://localhost:5000/api/events/564c57c8663849b587000001
  #
  #   resp.status
  #   => 200
  #
  #   resp.body
  #   => {"name":"Global Village Festival","description": "description", "location_name":"Penderyn Square",
  #       "location_address":"Merthyr Tydfil Town Centre","coordinates":[-3.381646,51.74872999999999],
  #       "starts":"2015-05-16T11:00:00+00:00","ends":"2015-05-16T17:00:00+00:00",
  #       "next_occurrence":"2015-05-16T11:00:00+00:00","duration":21600,
  #       "small_image":"/uploads/event/image/54f730e2f961bf93e9000001/landscape_small_thumb_Global_Village.JPG",
  #       "big_image":"/uploads/event/image/54f730e2f961bf93e9000001/landscape_big_thumb_Global_Village.JPG"}
  #
  #   curl -H "accept: application/vnd.welovemerthyr+json;version=1" http://localhost:5000/api/events/not_existing_record
  #
  #   resp.status
  #   => 404
  #
  #   resp.body
  #   => {"message": "Resource not found"}
  #
  def show
    @event = Event.find(params[:id])
    respond_with @event
  end
end
