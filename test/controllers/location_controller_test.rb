require 'test_helper'

class LocationControllerTest < ActionDispatch::IntegrationTest
  def setup
    @user          = users(:user_one)
    @business      = businesses(:one)
    @location      = locations(:one)
    @menu          = menus(:one)
    @location_menu = location_menus(:one)
    sign_in @user
  end

  test "get locations index" do
    get business_locations_url(@business.id)
    assert_response :success
  end

  test "get location show" do
    get business_location_url(@business.id, @location.id)
    assert_response :success
  end

  test "get show menus" do
    get show_menus_business_location_url(@business.id, @location.id)
    assert_response :success
  end

  test "menu can be removed from a location" do
    location = locations(:two)
    menu     = menus(:two)
    location_menu = LocationMenu.create(
      location_id: location.id,
      menu_id:     menu.id
    )
    assert location.persisted?
    delete remove_menu_business_location_url(@business.id, location.id, location_menu: location_menu.id)
    refute LocationMenu.find_by(id: location_menu.id)
  end

  test "menu can be added to a location" do
    location_menu = LocationMenu.find_by(location_id: @location.id, menu_id: @menu.id)
    delete remove_menu_business_location_url(@business.id, @location.id, location_menu: location_menu.id)
    refute LocationMenu.find_by(location_id: @location.id, menu_id: @menu.id)
    post   add_menu_business_location_url(@business.id, @location.id, menu_id: @menu.id)
    assert LocationMenu.find_by(location_id: @location.id, menu_id: @menu.id)
  end
end
