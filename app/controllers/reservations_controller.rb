class ReservationsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_reservation, only: %i[show update destroy]

  # GET /reservations
  def index
    @reservations = current_user.reservations

    render json: @reservations
  end

  # GET /reservations/1
  def show
    @reservation = current_user.reservations.find(params[:id])

    render json: @reservation
  end

  # POST /reservations
  def create
    # @reservation = Reservation.new(reservation_params)

    # @reservation = current_user.reservations.new(reservation_params)

    # @user = User.find(params[:user_id])
    @user = current_user
    @trip = Trip.find(params[:trip_id])
    @reservation = @user.reservations.new(date: reservation_params[:date], user_id: @user.id, trip_id: @trip.id)

    if @reservation.save
      render json: @reservation, status: :created

    else
      render json: @reservation.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /reservations/1
  def update
    if @reservation.update(reservation_params)
      render json: @reservation
    else
      render json: @reservation.errors, status: :unprocessable_entity
    end
  end

  # DELETE /reservations/1
  def destroy
    @reservation.destroy
    render json: { message: 'Reservation has been deleted Successfully.' }, status: :ok
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_reservation
    @reservation = Reservation.find(params[:id])
  end

  # Only allow a list of trusted parameters through.
  def reservation_params
    # params.require(:reservation).permit(:date, :user_id, :trip_id)
    params.require(:reservation).permit(:date)
  end
end
