require "test_helper"

class CloudManagementSystemsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @cloud_management_system = cloud_management_systems(:one)
  end

  test "should get index" do
    get cloud_management_systems_url
    assert_response :success
  end

  test "should get new" do
    get new_cloud_management_system_url
    assert_response :success
  end

  test "should create cloud_management_system" do
    assert_difference('CloudManagementSystem.count') do
      post cloud_management_systems_url, params: { cloud_management_system: { name: @cloud_management_system.name, value: @cloud_management_system.value } }
    end

    assert_redirected_to cloud_management_system_url(CloudManagementSystem.last)
  end

  test "should show cloud_management_system" do
    get cloud_management_system_url(@cloud_management_system)
    assert_response :success
  end

  test "should get edit" do
    get edit_cloud_management_system_url(@cloud_management_system)
    assert_response :success
  end

  test "should update cloud_management_system" do
    patch cloud_management_system_url(@cloud_management_system), params: { cloud_management_system: { name: @cloud_management_system.name, value: @cloud_management_system.value } }
    assert_redirected_to cloud_management_system_url(@cloud_management_system)
  end

  test "should destroy cloud_management_system" do
    assert_difference('CloudManagementSystem.count', -1) do
      delete cloud_management_system_url(@cloud_management_system)
    end

    assert_redirected_to cloud_management_systems_url
  end
end
