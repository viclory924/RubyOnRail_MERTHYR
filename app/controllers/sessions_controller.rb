class SessionsController < Devise::SessionsController
  layout 'new_admin'
  def new
    super
  end
end
