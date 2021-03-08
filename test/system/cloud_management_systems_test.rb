require "application_system_test_case"

class CloudManagementSystemsTest < ApplicationSystemTestCase
  setup do
    @cloud_management_system = cloud_management_systems(:one)
  end

  test "visiting the index" do
    visit cloud_management_systems_url
    assert_selector "h1", text: "Cloud Management Systems"
  end

  test "creating a Cloud management system" do
    visit cloud_management_systems_url
    click_on "New Cloud Management System"

    fill_in "Name", with: @cloud_management_system.name
    fill_in "Value", with: @cloud_management_system.value
    click_on "Create Cloud management system"

    assert_text "Cloud management system was successfully created"
    click_on "Back"
  end

  test "updating a Cloud management system" do
    visit cloud_management_systems_url
    click_on "Edit", match: :first

    fill_in "Name", with: @cloud_management_system.name
    fill_in "Value", with: @cloud_management_system.value
    click_on "Update Cloud management system"

    assert_text "Cloud management system was successfully updated"
    click_on "Back"
  end

  test "destroying a Cloud management system" do
    visit cloud_management_systems_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Cloud management system was successfully destroyed"
  end
end
