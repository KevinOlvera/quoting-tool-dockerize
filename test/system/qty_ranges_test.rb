require "application_system_test_case"

class QtyRangesTest < ApplicationSystemTestCase
  setup do
    @qty_range = qty_ranges(:one)
  end

  test "visiting the index" do
    visit qty_ranges_url
    assert_selector "h1", text: "Qty Ranges"
  end

  test "creating a Qty range" do
    visit qty_ranges_url
    click_on "New Qty Range"

    fill_in "Name", with: @qty_range.name
    fill_in "Value", with: @qty_range.value
    click_on "Create Qty range"

    assert_text "Qty range was successfully created"
    click_on "Back"
  end

  test "updating a Qty range" do
    visit qty_ranges_url
    click_on "Edit", match: :first

    fill_in "Name", with: @qty_range.name
    fill_in "Value", with: @qty_range.value
    click_on "Update Qty range"

    assert_text "Qty range was successfully updated"
    click_on "Back"
  end

  test "destroying a Qty range" do
    visit qty_ranges_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Qty range was successfully destroyed"
  end
end
