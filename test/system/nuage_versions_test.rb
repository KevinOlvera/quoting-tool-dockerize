require "application_system_test_case"

class NuageVersionsTest < ApplicationSystemTestCase
  setup do
    @nuage_version = nuage_versions(:one)
  end

  test "visiting the index" do
    visit nuage_versions_url
    assert_selector "h1", text: "Nuage Versions"
  end

  test "creating a Nuage version" do
    visit nuage_versions_url
    click_on "New Nuage Version"

    fill_in "Name", with: @nuage_version.name
    fill_in "Value", with: @nuage_version.value
    click_on "Create Nuage version"

    assert_text "Nuage version was successfully created"
    click_on "Back"
  end

  test "updating a Nuage version" do
    visit nuage_versions_url
    click_on "Edit", match: :first

    fill_in "Name", with: @nuage_version.name
    fill_in "Value", with: @nuage_version.value
    click_on "Update Nuage version"

    assert_text "Nuage version was successfully updated"
    click_on "Back"
  end

  test "destroying a Nuage version" do
    visit nuage_versions_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Nuage version was successfully destroyed"
  end
end
