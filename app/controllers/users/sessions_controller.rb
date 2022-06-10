class Users::SessionsController < Devise::SessionsController
  respond_to :json

  def destroy
    sign_out current_user
    render json: { message: 'logged out......'}, status: :ok
  end

  private

  def respond_with(_resource, _opts = {})
    render json: { message: "#{current_user.user_name} You are logged in." }, status: :ok
    # render json: { message: current_user.user_name }, status: :ok
  end

  def respond_to_on_destroy
    log_out_success && return if current_user

    log_out_failure
  end

  def log_out_success
    # def sign_in
    # end
    # render json: { message: 'You are logged out.' }, status: :ok
    render json: { message: current_user.user_name }, status: :ok
  end

  def log_out_failure
    render json: { message: 'Hmm nothing happened.' }, status: :unauthorized
  end
end
