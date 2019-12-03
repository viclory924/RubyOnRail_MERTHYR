class PostsController < ApplicationController
  PER_PAGE = 20

  load_and_authorize_resource

  layout 'new_admin'

  def index
    @posts = Post.newest.page(params[:page]).per(PER_PAGE)

    respond_to do |format|
      #format.html # index.html.erb
      format.html { render layout: 'new_admin' } # index.html.erb
      format.json { render json: @posts }
    end
  end

  def show
    respond_to do |format|
      # format.html # show.html.erb
      format.html { render layout: 'new_admin' }
      format.json { render json: @post }
    end
  end

  def new
    respond_to do |format|
      format.html # new.html.erb
      #format.html { render layout: 'new_admin' }
      format.json { render json: @post }
    end
  end

  def create
    respond_to do |format|
      if @post.save
        format.html { redirect_to @post, notice: 'Post was successfully created.' }
        format.json { render json: @post, status: :created, location: @post }
      else
        format.html { render action: "new" }
        format.json { render json: @post.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    respond_to do |format|
      if @post.update_attributes(post_params)
        format.html { redirect_to @post, notice: 'Post was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @post.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @post.destroy

    respond_to do |format|
      format.html { redirect_to posts_url, notice: 'Post was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private

  def post_params
    params.require(:post).permit(:title, :body, :status, :published_at, :image,
      :remove_image, :category, :image_mode)
  end
end
