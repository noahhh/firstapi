require 'test_helper'

class SeatsControllerTest < ActionController::TestCase
  setup do
    @seat = seats(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:seats)
  end

  test "should create seat" do
    assert_difference('Seat.count') do
      post :create, seat: { name: @seat.name }
    end

    assert_response 201
  end

  test "should show seat" do
    get :show, id: @seat
    assert_response :success
  end

  test "should update seat" do
    put :update, id: @seat, seat: { name: @seat.name }
    assert_response 204
  end

  test "should destroy seat" do
    assert_difference('Seat.count', -1) do
      delete :destroy, id: @seat
    end

    assert_response 204
  end
end
