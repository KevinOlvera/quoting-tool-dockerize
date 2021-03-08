require "test_helper"

class QtyRangesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @qty_range = qty_ranges(:one)
  end

  test "should get index" do
    get qty_ranges_url
    assert_response :success
  end

  test "should get new" do
    get new_qty_range_url
    assert_response :success
  end

  test "should create qty_range" do
    assert_difference('QtyRange.count') do
      post qty_ranges_url, params: { qty_range: { name: @qty_range.name, value: @qty_range.value } }
    end

    assert_redirected_to qty_range_url(QtyRange.last)
  end

  test "should show qty_range" do
    get qty_range_url(@qty_range)
    assert_response :success
  end

  test "should get edit" do
    get edit_qty_range_url(@qty_range)
    assert_response :success
  end

  test "should update qty_range" do
    patch qty_range_url(@qty_range), params: { qty_range: { name: @qty_range.name, value: @qty_range.value } }
    assert_redirected_to qty_range_url(@qty_range)
  end

  test "should destroy qty_range" do
    assert_difference('QtyRange.count', -1) do
      delete qty_range_url(@qty_range)
    end

    assert_redirected_to qty_ranges_url
  end
end
