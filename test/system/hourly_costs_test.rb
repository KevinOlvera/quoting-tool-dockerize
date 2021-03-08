require "application_system_test_case"

class HourlyCostsTest < ApplicationSystemTestCase
  setup do
    @hourly_cost = hourly_costs(:one)
  end

  test "visiting the index" do
    visit hourly_costs_url
    assert_selector "h1", text: "Hourly Costs"
  end

  test "creating a Hourly cost" do
    visit hourly_costs_url
    click_on "New Hourly Cost"

    fill_in "Design engineer", with: @hourly_cost.design_engineer
    fill_in "Lead architect", with: @hourly_cost.lead_architect
    fill_in "Network integration", with: @hourly_cost.network_integration
    fill_in "Technical project manager", with: @hourly_cost.technical_project_manager
    click_on "Create Hourly cost"

    assert_text "Hourly cost was successfully created"
    click_on "Back"
  end

  test "updating a Hourly cost" do
    visit hourly_costs_url
    click_on "Edit", match: :first

    fill_in "Design engineer", with: @hourly_cost.design_engineer
    fill_in "Lead architect", with: @hourly_cost.lead_architect
    fill_in "Network integration", with: @hourly_cost.network_integration
    fill_in "Technical project manager", with: @hourly_cost.technical_project_manager
    click_on "Update Hourly cost"

    assert_text "Hourly cost was successfully updated"
    click_on "Back"
  end

  test "destroying a Hourly cost" do
    visit hourly_costs_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Hourly cost was successfully destroyed"
  end
end
