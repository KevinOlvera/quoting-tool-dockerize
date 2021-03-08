require "test_helper"

class VerticalsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @vertical = verticals(:one)
  end

  test "should get index" do
    get verticals_url
    assert_response :success
  end

  test "should get new" do
    get new_vertical_url
    assert_response :success
  end

  test "should create vertical" do
    assert_difference('Vertical.count') do
      post verticals_url, params: { vertical: { name: @vertical.name, value: @vertical.value } }
    end

    assert_redirected_to vertical_url(Vertical.last)
  end

  test "should show vertical" do
    get vertical_url(@vertical)
    assert_response :success
  end

  test "should get edit" do
    get edit_vertical_url(@vertical)
    assert_response :success
  end

  test "should update vertical" do
    patch vertical_url(@vertical), params: { vertical: { name: @vertical.name, value: @vertical.value } }
    assert_redirected_to vertical_url(@vertical)
  end

  test "should destroy vertical" do
    assert_difference('Vertical.count', -1) do
      delete vertical_url(@vertical)
    end

    assert_redirected_to verticals_url
  end
end
