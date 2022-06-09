class ApplicationController < ActionController::API
  before_action :authenticate_user!
  before_action :configure_permitted_parameters, if: :devise_controller?

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_in) do |user_params|
      user_params.permit(:user_name, :email, :password)
    end

    devise_parameter_sanitizer.permit(:sign_up) { |u| u.permit(:user_name, :email, :password) }
  end
end
