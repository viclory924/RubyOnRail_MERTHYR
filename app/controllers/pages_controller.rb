class PagesController < ApplicationController
  PER_PAGE = 20

  load_and_authorize_resource except: [:home, :blog, :blog_post, :events, :event,
                                       :business, :front, :vouchers, :voucher, :admin, :businesses,
                                       :shoppings, :shopping, :businesses_category, :new_subscriber, :create_subscriber,
                                       :static_page, :visiting, :guides, :public_show, :businesses_results, :privacy_policy]

  include BusinessesHelper
  include EventsHelper

  def index    
    @pages = Page.newest.page(params[:page]).per(PER_PAGE)

    respond_to do |format|
      format.html { render layout: 'new_admin' } # index.html.erb
      format.json { render json: @pages }
    end
  end

  def show
    respond_to do |format|
      # format.html { render layout: 'admin' }# show.html.erb
      format.html { render layout: 'new_admin' }
      format.json { render json: @page }
    end
  end

  def new
    respond_to do |format|
      # format.html { render layout: 'admin' }# new.html.erb
      format.html { render layout: 'new_admin' }
      format.json { render json: @page }
    end
  end

  def create
    respond_to do |format|
      if @page.save
        format.html { redirect_to @page, notice: 'Page was successfully created.' }
        format.json { render json: @page, status: :created, location: @page }
      else
        format.html { render action: "new", layout: 'admin' }
        format.json { render json: @page.errors, status: :unprocessable_entity }
      end
    end
  end

  def edit
    render layout: 'new_admin'
  end

  def update
    respond_to do |format|
      if @page.update_attributes(page_params)
        format.html { redirect_to @page, notice: 'Page was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit", layout: 'admin' }
        format.json { render json: @page.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @page.destroy

    respond_to do |format|
      format.html { redirect_to pages_url, notice: 'Page was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  # Admin dashboard
  def admin
    return redirect_to new_user_session_path unless current_user && current_user.is_admin
    render layout: 'new_admin'
  end

  #
  # Public pages
  #

  def blog
    @posts = Post.published.page params[:page]
    @page_title = 'News'
    render layout: 'front'
  end

  def blog_post
    @post = Post.find(params[:id])
    @page_title = @post.title
    return redirect_to blog_path unless @post.published?
    render layout: 'front'
  end

  def events
    @events = EnumerableEvents.new(Event.where(:next_occurrence.gte => Time.now, :ends.gte => Time.now).asc(:next_occurrence).group_by(&:starts))
    #@events = Event.all
    # @events_by_date = EnumerableEvents.new(Event.all.group_by(&:starts))
    @date = params[:date] ? Date.parse(params[:date]) : Date.today

    @page_title = 'Events'
    render layout: 'front'
  end

  def event
    @event = Event.find(params[:id])
    @page_title = @event.name

    @hash = [@event].inject([]) do |a, e|
      a << { "lat" => e.lat, "lng" => e.lon, "infowindow" => event_infowindow(e) }
    end
    render layout: 'front'
  end

  def businesses_results
    @businesses = Business.search(params[:query], params[:page])

    # if @businesses.any?
    #   @starts_with = params[:starts_with] || @businesses.map(&:name).sort.first.downcase[0]
    #   @paginated_businesses = @businesses.select { |b| b.name.downcase.starts_with?(@starts_with) }
    # else
    #   @paginated_businesses = []
    # end

    @random_services = Business.random_services(20)

    @page_title = 'Search results'

    respond_to do |format|
      format.html{ render layout: 'front' }
      format.js
    end
  end

  # Shopping & Eating and Drinking menu
  def businesses_category
    options = params.except(:controller, :action)
    tag = options.delete(:tag) if options.has_key? :tag

    @businesses = Business.where(category: params[:cat]).order_by(:name.asc)
    @businesses = @businesses.where(:services => /#{tag}/) if tag.present?
    @businesses = @businesses.page(params[:page]).per(30)

    # if @businesses.any?
    #   @starts_with = params[:starts_with] || @businesses.map(&:name).sort.first.downcase[0]
    #   @paginated_businesses = @businesses.order_by("name ASC").select { |b| b.name.downcase.starts_with?(@starts_with) }
    # else
    #   @paginated_businesses = []
    # end

    @template = BusinessCategoryTemplate.where(category: params[:cat]).first

    @random_services = Business.random_services(20, params[:cat])

    @page_title = params[:cat]

    respond_to do |format|
      format.html{ render layout: 'front' }
      format.js
    end
  end

  def business
    @business = Business.find params[:id]

    @hash = [@business].inject([]) do |a, b|
      a << { "lat" => b.lat, "lng" => b.lon, "infowindow" => infowindow_single(b) }
    end

    @page_title = @business.name

    render layout: 'front'
  end
  # End Shopping... menu.

  def vouchers
    @deals = Deal.approved.available #.page params[:page]
    #@deals = Deal.all.page params[:page]
    @page_title = 'Vouchers'
    render layout: 'front'
  end

  def voucher
    @deal = Deal.find params[:id]
    @page_title = @deal.title

    respond_to do |format|
      format.html do
         if @deal.unapproved?
          redirect_to public_vouchers_path
        else
          render layout: 'front'
        end
      end
      format.pdf do
        pdf = DealPdf.new(@deal, view_context)
        send_data pdf.render, filename: "#{@deal.title}.pdf",
                              type: 'application/pdf',
                              disposition: 'inline'
      end
    end
  end

  def visiting
    @page_title = 'Visiting'

    render layout: 'front'
  end

  def guides
    businesses = Business.all.reject { |b| b.lat.blank? || b.lon.blank? }
    @hash = businesses.inject([]) do |a, b|
      a << { "lat" => b.lat, "lng" => b.lon, "infowindow" => infowindow_multiple(b) }
    end

    @page_title = 'Maps & Guides'
    render layout: 'front'
  end

  def update_guides_map
    businesses = Business.all.select { |b| params[:selected_cats].include?(b.category) && (b.lat.present? || b.lon.present?) }

    @hash = businesses.inject([]) do |a, b|
      a << { "lat" => b.lat, "lng" => b.lon, "infowindow" => infowindow_multiple(b) }
    end
  end

  def public_show
    @page = Page.find params[:id]
    @page_title = @page.title
    render layout: set_layout
    #render layout: 'front'
  end

  def static_page
    @page = PageTemplate.find(params[:id])
  end

  def front
    render layout: 'front'
    @tagstyle = ['', 'secondary','tertiary', 'quadary']
  end

  def new_subscriber
    @subscriber = Subscriber.new
    respond_to do |format|
      format.html { render layout: 'front' }
      format.json { render json: @subscriber }
    end
  end

  def create_subscriber
    @subscriber = Subscriber.new(subscriber_params)
    if @subscriber.save
      if @subscriber.order_card
        SubscriberMailer.welcome_email(@subscriber).deliver
      end
      respond_to do |format|
        flash[:notice] = 'Thanks for subscribing to the loyaly card'
        format.html { redirect_to root_path }
      end
    else
      respond_to do |format|
        format.html { render 'new_subscriber', layout: 'front'}
        format.json { render json: @subscriber.errors, status: :unprocessable_entity }
      end
    end
  end

  def privacy_policy
    
  end


  private

  def set_layout
    @page.page_template.try(:layout_name) || 'front'
  end

  def page_params
    params.require(:page).permit(:title, :body, :page_template_id, :status, :parent_id)
  end

  def subscriber_params
    params.require(:subscriber).permit(:first_name, :last_name, :email, :mobile, :address, :postcode, :deal_id, :order_card)
  end
end
