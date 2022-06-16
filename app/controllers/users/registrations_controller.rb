class Users::RegistrationsController < Devise::RegistrationsController
  respond_to :json

  private

   # rubocop:disable Layout/TrailingWhitespace
  def respond_with(resource, _opts = {})
    register_success && return if resource.persisted?
    
    register_failed
  end
 # rubocop:enable Layout/TrailingWhitespace

  def register_success
    @token = SecureRandom.hex
    render json: { message: "#{current_user.user_name} has signed up sucessfully.", auth_token: @token }, status: :ok
  end

  def register_failed
    render json: { message: 'Something went wrong.' }
  end
end
