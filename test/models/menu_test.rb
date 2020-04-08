require 'test_helper'

class MenuTest < ActiveSupport::TestCase
  def setup
    @business = businesses(:one)
    @menu =
      Menu.new(
        display_name: "some menu",
        internal_name: "some-menu",
        business_id: @business.id,
        menu_url: "some-menu",
      ) 
  end

  test "valid menu" do
    assert @menu.valid?
  end

  test "display name is required" do
    @menu.display_name = ""
    refute @menu.valid?
  end

  test "internal name is required" do
    @menu.internal_name = ""
    refute @menu.valid?
  end

  test "internal name is unique for menus in the business" do
    assert @menu.save
    @second_menu = @menu.dup
    refute @second_menu.valid?
    @second_menu.internal_name = "something else"
    assert @second_menu.valid?
  end
end
