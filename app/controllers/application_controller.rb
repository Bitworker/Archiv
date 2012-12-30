class ApplicationController < ActionController::Base
  # default route after login
  def after_sign_up_path_for(resource)
    user_path(resource)
    return request.env['omniauth.origin'] || session[:return_to] 
  end 

  def after_sign_in_path_for(resource)
  	user_path(resource)
    return request.env['omniauth.origin'] || session[:return_to]
  end
end
