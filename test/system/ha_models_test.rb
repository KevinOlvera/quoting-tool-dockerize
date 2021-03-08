require "application_system_test_case"

class HaModelsTest < ApplicationSystemTestCase
  setup do
    @ha_model = ha_models(:one)
  end

  test "visiting the index" do
    visit ha_models_url
    assert_selector "h1", text: "Ha Models"
  end

  test "creating a Ha model" do
    visit ha_models_url
    click_on "New Ha Model"

    fill_in "Name", with: @ha_model.name
    fill_in "Value", with: @ha_model.value
    click_on "Create Ha model"

    assert_text "Ha model was successfully created"
    click_on "Back"
  end

  test "updating a Ha model" do
    visit ha_models_url
    click_on "Edit", match: :first

    fill_in "Name", with: @ha_model.name
    fill_in "Value", with: @ha_model.value
    click_on "Update Ha model"

    assert_text "Ha model was successfully updated"
    click_on "Back"
  end

  test "destroying a Ha model" do
    visit ha_models_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Ha model was successfully destroyed"
  end
end
