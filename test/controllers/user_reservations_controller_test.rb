require "test_helper"

class UserReservationsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @user_reservation = user_reservations(:one)
  end

  test "should get index" do
    get user_reservations_url, as: :json
    assert_response :success
  end

  test "should create user_reservation" do
    assert_difference("UserReservation.count") do
      post user_reservations_url, params: { user_reservation: { trip_id: @user_reservation.trip_id, user_id: @user_reservation.user_id } }, as: :json
    end

    assert_response :created
  end

  test "should show user_reservation" do
    get user_reservation_url(@user_reservation), as: :json
    assert_response :success
  end

  test "should update user_reservation" do
    patch user_reservation_url(@user_reservation), params: { user_reservation: { trip_id: @user_reservation.trip_id, user_id: @user_reservation.user_id } }, as: :json
    assert_response :success
  end

  test "should destroy user_reservation" do
    assert_difference("UserReservation.count", -1) do
      delete user_reservation_url(@user_reservation), as: :json
    end

    assert_response :no_content
  end
end
