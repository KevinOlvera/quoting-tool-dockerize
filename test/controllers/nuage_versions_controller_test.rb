require "test_helper"

class NuageVersionsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @nuage_version = nuage_versions(:one)
  end

  test "should get index" do
    get nuage_versions_url
    assert_response :success
  end

  test "should get new" do
    get new_nuage_version_url
    assert_response :success
  end

  test "should create nuage_version" do
    assert_difference('NuageVersion.count') do
      post nuage_versions_url, params: { nuage_version: { name: @nuage_version.name, value: @nuage_version.value } }
    end

    assert_redirected_to nuage_version_url(NuageVersion.last)
  end

  test "should show nuage_version" do
    get nuage_version_url(@nuage_version)
    assert_response :success
  end

  test "should get edit" do
    get edit_nuage_version_url(@nuage_version)
    assert_response :success
  end

  test "should update nuage_version" do
    patch nuage_version_url(@nuage_version), params: { nuage_version: { name: @nuage_version.name, value: @nuage_version.value } }
    assert_redirected_to nuage_version_url(@nuage_version)
  end

  test "should destroy nuage_version" do
    assert_difference('NuageVersion.count', -1) do
      delete nuage_version_url(@nuage_version)
    end

    assert_redirected_to nuage_versions_url
  end
end
