require 'test_helper'

class MenuTest < ActiveSupport::TestCase
  def setup
    @business = businesses(:one)
    @menu =
      Menu.new(
        name: "some menu",
        business_id: @business.id,
        menu_url: "some-menu",
      ) 
  end

  test "valid menu" do
    assert @menu.valid?
  end

  test "name is required" do
    @menu.name = nil
    refute @menu.valid?
  end
end
