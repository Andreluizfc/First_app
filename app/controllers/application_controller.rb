class ApplicationController < ActionController::Base
  protect_from_forgery
  private
  
  #Method for authentication
  def auth
    authenticate_or_request_with_http_basic do |user, password|
      user == 'admin' && password == 'rails'
    end
  end

end
