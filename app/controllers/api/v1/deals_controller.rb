class Api::V1::DealsController < Api::BaseController

  ##
  # Returns all approved and available deals
  #
  # GET /api/v1/deals
  #
  # params:
  #   header - API Version
  #
  # = Examples
  #
  #   curl -H "accept: application/vnd.welovemerthyr+json;version=1" http://localhost:5000/api/deals
  #
  #   resp.status
  #   => 200
  #
  #   resp.body
  #   [{"id":"52f618268eb4000495000001","title":"Valentines gift package for \u00a345","business":"Ann's Flowers ","end_date":"2014-02-14"}, {...}]

  def index
    since     = params[:since]

    @deals = Deal.approved.available.newest
    @deals = @deals.where(:updated_at.gte => Time.parse(since)) if since.present?
    respond_with @deals
  end

  ##
  # Returns the deal for the given deal id
  #
  # GET /api/v1/deals/564c57c8663849b587000001
  #
  # params:
  #   header - API Version
  #
  # = Examples
  #
  #   curl -H "accept: application/vnd.welovemerthyr+json;version=1" http://localhost:5000/api/deals/564c57c8663849b587000001
  #
  #   resp.status
  #   => 200
  #
  #   resp.body
  #   => {"title":"Valentines gift package for \u00a345","description":"","business":"Ann's Flowers ","start_date":"2014-02-08",
  #       "end_date":"2014-02-14", "terms":"term text,
  #       "image":"/uploads/deal/image/52f618268eb4000495000001/thumb_freedom.jpg"}
  #
  #   curl -H "accept: application/vnd.welovemerthyr+json;version=1" http://localhost:5000/api/deals/not_existing_record
  #
  #   resp.status
  #   => 404
  #
  #   resp.body
  #   => {"message": "Resource not found"}
  #

  def show
    @deal = Deal.find(params[:id])
    respond_with @deal
  end
end
