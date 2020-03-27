require 'test_helper'

class MenuItemTest < ActiveSupport::TestCase
  def setup
    @category = categories(:one)
    @menu_item = 
      MenuItem.new(
        name: "some item",
        description: "some item description",
        price: 10,
        category_id: @category.id,
        display_sequence_number: 1
      )
  end

  test "valid menu item" do
    assert @menu_item.valid?
  end

  test "name is required" do
    @menu_item.name = nil
    refute @menu_item.valid?
  end

  test "description is required" do
    @menu_item.description = nil
    refute @menu_item.valid?
  end

  test "price is required" do
    @menu_item.price = nil
    refute @menu_item.valid?
  end

  test "diplay sequence number is required" do
    @menu_item.display_sequence_number = nil
    refute @menu_item.valid?
  end

  test "category is required" do
    @menu_item.category_id = nil
    refute @menu_item.valid?
  end
end
