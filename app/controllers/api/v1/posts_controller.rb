class Api::V1::PostsController < Api::BaseController

  ##
  # Returns all posts within the last 6 months
  #
  # GET /api/v1/posts
  #
  # params:
  #   header - API Version
  #
  # = Examples
  #
  #   curl -H "accept: application/vnd.welovemerthyr+json;version=1" http://localhost:5000/api/posts
  #
  #   resp.status
  #   => 200
  #
  #   resp.body
  #   [{"id":"564c57c8663849b587000001","published_at":"2015-11-18T10:49:44+00:00","title":"Merthyr Winter Market & Skating Rink Returns","category":"News","image":"/uploads/post/image/564c57c8663849b587000001/landscape_big_thumb_PO_061214_Merthyr_On_Ice_39.jpg"}, {...} ]
  
  def index
    @posts = Post.published.where(:published_at.gte => 6.months.ago).order_by(published_at: :desc)
    respond_with @posts
  end

  ##
  # Returns the post for the given post id
  #
  # GET /api/v1/posts/564c57c8663849b587000001
  #
  # params:
  #   header - API Version
  #
  # = Examples
  #
  #   curl -H "accept: application/vnd.welovemerthyr+json;version=1" http://localhost:5000/api/posts/564c57c8663849b587000001
  #
  #   resp.status
  #   => 200
  #
  #   resp.body
  #   => {"published_at":"2015-11-18T10:49:44+00:00","title":"Merthyr Winter Market & Skating Rink Returns", 
  #       "body": "text", ,"category":"News",
  #       "image":"/uploads/post/image/564c57c8663849b587000001/landscape_big_thumb_PO_061214_Merthyr_On_Ice_39.jpg"}
  #
  #   curl -H "accept: application/vnd.welovemerthyr+json;version=1" http://localhost:5000/api/posts/not_existing_record
  #
  #   resp.status
  #   => 404
  #
  #   resp.body
  #   => {"message": "Resource not found"}
  #

  def show
    @post = Post.published.find(params[:id])
    respond_with @post
  end
end
