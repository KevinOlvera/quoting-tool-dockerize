require "test_helper"

class HourlyCostsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @hourly_cost = hourly_costs(:one)
  end

  test "should get index" do
    get hourly_costs_url
    assert_response :success
  end

  test "should get new" do
    get new_hourly_cost_url
    assert_response :success
  end

  test "should create hourly_cost" do
    assert_difference('HourlyCost.count') do
      post hourly_costs_url, params: { hourly_cost: { design_engineer: @hourly_cost.design_engineer, lead_architect: @hourly_cost.lead_architect, network_integration: @hourly_cost.network_integration, technical_project_manager: @hourly_cost.technical_project_manager } }
    end

    assert_redirected_to hourly_cost_url(HourlyCost.last)
  end

  test "should show hourly_cost" do
    get hourly_cost_url(@hourly_cost)
    assert_response :success
  end

  test "should get edit" do
    get edit_hourly_cost_url(@hourly_cost)
    assert_response :success
  end

  test "should update hourly_cost" do
    patch hourly_cost_url(@hourly_cost), params: { hourly_cost: { design_engineer: @hourly_cost.design_engineer, lead_architect: @hourly_cost.lead_architect, network_integration: @hourly_cost.network_integration, technical_project_manager: @hourly_cost.technical_project_manager } }
    assert_redirected_to hourly_cost_url(@hourly_cost)
  end

  test "should destroy hourly_cost" do
    assert_difference('HourlyCost.count', -1) do
      delete hourly_cost_url(@hourly_cost)
    end

    assert_redirected_to hourly_costs_url
  end
end
