class Users::RegistrationsController < Devise::RegistrationsController
  respond_to :json

  private
  # rubocop:disable
  def respond_with(resource, _opts = {})
    register_success && return if resource.persisted?

    register_failed
  end
  # rubocop:disable
  def register_success
    render json: { message: "#{current_user.user_name} has signed up sucessfully." }, status: :ok
  end

  def register_failed
    render json: { message: 'Something went wrong.' }
  end
end
