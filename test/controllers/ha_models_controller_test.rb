require "test_helper"

class HaModelsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @ha_model = ha_models(:one)
  end

  test "should get index" do
    get ha_models_url
    assert_response :success
  end

  test "should get new" do
    get new_ha_model_url
    assert_response :success
  end

  test "should create ha_model" do
    assert_difference('HaModel.count') do
      post ha_models_url, params: { ha_model: { name: @ha_model.name, value: @ha_model.value } }
    end

    assert_redirected_to ha_model_url(HaModel.last)
  end

  test "should show ha_model" do
    get ha_model_url(@ha_model)
    assert_response :success
  end

  test "should get edit" do
    get edit_ha_model_url(@ha_model)
    assert_response :success
  end

  test "should update ha_model" do
    patch ha_model_url(@ha_model), params: { ha_model: { name: @ha_model.name, value: @ha_model.value } }
    assert_redirected_to ha_model_url(@ha_model)
  end

  test "should destroy ha_model" do
    assert_difference('HaModel.count', -1) do
      delete ha_model_url(@ha_model)
    end

    assert_redirected_to ha_models_url
  end
end
