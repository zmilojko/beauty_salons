class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  layout :layout_by_resource
  before_filter :configure_permitted_parameters, if: :devise_controller?

  WillPaginate.per_page = 10


  protected

   def configure_permitted_parameters
       devise_parameter_sanitizer.for(:sign_up) { |u| u.permit(:email, :password, :control) }
       devise_parameter_sanitizer.for(:account_update) { |u| u.permit(:email, :password, :current_password) }
   end

  def layout_by_resource
   if devise_controller?
     "admin"
   else
     "application"
   end
  end
end
