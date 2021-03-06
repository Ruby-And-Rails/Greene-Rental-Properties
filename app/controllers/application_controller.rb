class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  include SessionsHelper
  
  $dir_property_small = 'uploads/property/small/';
  $dir_property_large = 'uploads/property/large/';
  
  
  private
  
  def require_login
    unless logged_in?
      flash[:danger] = "You must be logged in to access this section"
      redirect_to login_url # halts request cycle
    end
  end
end
