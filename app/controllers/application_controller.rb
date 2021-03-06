require 'mailchimp'
class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  layout :layout_by_resource
  before_action :setup_mailchimp_api
  before_filter :configure_permitted_parameters, if: :devise_controller?

  WillPaginate.per_page = 10

  def setup_mailchimp_api
    @mailchimp = Mailchimp::API.new(ENV["MAILCHIMP_API_KEY"])
    @list_id = ENV["MAILCHIMP_LIST_ID"]
  end


  protected

  def super_admin_permissions
    if current_user.control.to_i == 0
      return true
    else
      flash[:alert] = t("no_right_to_do_that")
      redirect_to root_path
    end
  end

  def after_sign_up_path_for(resource)
     '/' # Or :prefix_to_your_route
   end

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
