class UsersController < ApplicationController
  # before_action :authenticate_user!
  # before_action :set_user, only: %i[show update destroy]

  # GET /users
  def index
    @users = User.all

    render json: @users, status: :ok
  end

  # DELETE /users/1
  def destroy
    @user.destroy
  end
end
