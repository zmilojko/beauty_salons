class RegistrationsController < Devise::RegistrationsController

  def new
    flash[:alert] = t("no_signup_available")
    redirect_to root_path
  end

  def create
    flash[:alert] = t("no_signup_available")
    redirect_to rooth_path
  end
end
