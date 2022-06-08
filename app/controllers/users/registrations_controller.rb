class Users::RegistrationsController < Devise::RegistrationsController
  respond_to :json

  private

  def respond_with(resource, _opts = {})
    register_success && return if resource.persisted?

    register_failed
  end

  def register_success
    # @user = current_user
    # message = 'Signed in successfully ${@user.user_name}'
    # render json: { message => :message }
    # render json: { message: 'Signed up sucessfully.' }
    render json: { message: current_user.user_name }

  end

  def register_failed
    render json: { message: 'Something went wrong.' }
  end
end
