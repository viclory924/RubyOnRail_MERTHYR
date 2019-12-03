class Api::V1::BusinessesController < Api::BaseController
  PER_PAGE = 25

  ##
  # Returns paginated collection of businesses
  #
  # GET /api/v1/businesses
  #
  #. Also can filter by category.
  #
  # GET /api/v1/businesses/Shopping
  #
  # To filter by service tag, pass tag name as a query param.
  #
  # GET /api/v1/businesses/?tag=cloths
  # GET /api/v1/businesses/Shopping/?tag=cloths
  #
  # params:
  #   header - API Version
  #
  # = Examples
  #
  #   curl -H "accept: application/vnd.welovemerthyr+json;version=1" http://localhost:5000/api/businesses
  #
  #   resp.status
  #   => 200
  #
  #   resp.body
  #   [{"id":"522e2ea69ef1ea5cdf000008","name":"4 Sure Wales","category":"Services","address":"7 Glebeland Street ",
  #   "town":"Merthyr Tydfil","postcode":"CF47 8AU","telephone":"01685 373311","website":"http://www.4surewales.co.uk", photo: ''},{ ...}]

  def index
    category  = params[:category]
    tag       = params[:tag]
    query     = params[:query]
    page      = params[:page]
    since     = params[:since]

    @businesses = Business.order_by("name asc")
    @businesses = @businesses.where(:updated_at.gte => Time.parse(since)) if since.present?
    @businesses = @businesses.where(category: category) if category.present?
    @businesses = @businesses.where(:services => /#{tag}/) if tag.present?
    @businesses = @businesses.or(services: /#{query}/i).or(name: /#{query}/i) if query.present?
    @businesses = @businesses.page(page).per(PER_PAGE) if page.present?

    respond_with @businesses
  end

  ##
  # Returns the business for the given post id
  #
  # GET /api/v1/business/564c57c8663849b587000001
  #
  # params:
  #   header - API Version
  #
  # = Examples
  #
  #   curl -H "accept: application/vnd.welovemerthyr+json;version=1" http://localhost:5000/api/business/564c57c8663849b587000001
  #
  #   resp.status
  #   => 200
  #
  #   resp.body
  #   => {"name":"4 Sure Wales","category":"Services","contact":"Stephen Bew","address":"7 Glebeland Street ","town":"Merthyr Tydfil","postcode":"CF47 8AU","telephone":"01685 373311","website":"http://www.4surewales.co.uk","email":"steve@4surewales.co.uk","twitter":"@","facebook":false,"services":"insurance,general insurance,house insurance,car insurance,travel insurance,liability insurance,business insurance","profile":"","photo":"/uploads/business/photo/522e2ea69ef1ea5cdf000008/small_thumb_SAM_1422.JPG","coordinates":[-3.3790813,51.7465215],"zone":"Main BID","monday":"9am - 9am","tuesday":"9am - 9am","wednesday":"9am - 9am","thursday":"9am - 9am","friday":"9am - 9am","saturday":"9am - 9am","sunday":"Closed"}
  #
  #   curl -H "accept: application/vnd.welovemerthyr+json;version=1" http://localhost:5000/api/business/not_existing_record
  #
  #   resp.status
  #   => 404
  #
  #   resp.body
  #   => {"message": "Resource not found"}
  #
  
  def show
    @business = Business.find(params[:id])
    respond_with @business
  end
end
