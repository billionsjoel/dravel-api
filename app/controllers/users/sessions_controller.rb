class Users::SessionsController < Devise::SessionsController
  respond_to :json

  def destroy
    sign_out current_user
    render json: { message: "#{current_user.user_name} has logged out." }, status: :ok
  end

  private

  def respond_with(_resource, _opts = {})
    @token = SecureRandom.hex
    render json: { message: "#{current_user.user_name} has logged in.", auth_token: @token }, status: :ok
  end

  def respond_to_on_destroy
    log_out_success && return if current_user

    log_out_failure
  end

  def log_out_success
    render json: { message: "#{current_user.user_name} logged out..." }, status: :ok
  end

  def log_out_failure
    render json: { message: "#{current_user.user_name} Hmm nothing happened.." }, status: :unauthorized
  end
end
