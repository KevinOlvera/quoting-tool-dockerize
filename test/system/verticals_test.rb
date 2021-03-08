require "application_system_test_case"

class VerticalsTest < ApplicationSystemTestCase
  setup do
    @vertical = verticals(:one)
  end

  test "visiting the index" do
    visit verticals_url
    assert_selector "h1", text: "Verticals"
  end

  test "creating a Vertical" do
    visit verticals_url
    click_on "New Vertical"

    fill_in "Name", with: @vertical.name
    fill_in "Value", with: @vertical.value
    click_on "Create Vertical"

    assert_text "Vertical was successfully created"
    click_on "Back"
  end

  test "updating a Vertical" do
    visit verticals_url
    click_on "Edit", match: :first

    fill_in "Name", with: @vertical.name
    fill_in "Value", with: @vertical.value
    click_on "Update Vertical"

    assert_text "Vertical was successfully updated"
    click_on "Back"
  end

  test "destroying a Vertical" do
    visit verticals_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Vertical was successfully destroyed"
  end
end
