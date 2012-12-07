class ApplicationController < ActionController::Base
  protect_from_forgery

  # default route after login
  def after_sign_in_path_for(resource)
     stored_location_for(resource)
  end




end
