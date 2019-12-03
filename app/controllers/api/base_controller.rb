class Api::BaseController < ApplicationController
  skip_before_filter  :verify_authenticity_token
  protect_from_forgery with: :null_session
  respond_to :json
  rescue_from Mongoid::Errors::DocumentNotFound, :with => :record_not_found
  Time.zone = 'UTC'

private

  def record_not_found(error)
    render :json => {:error => 'Resource not found'}, :status => :not_found
  end 
end
