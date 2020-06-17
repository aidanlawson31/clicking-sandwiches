require 'test_helper'

class CategoryTest < ActiveSupport::TestCase
  def setup
    @menu = menus(:one)
    @category =
      Category.new(
        menu_id: @menu.id,
        name:    'some name',
        display_sequence_number: 1
      )
  end
  
  test "valid category" do
    assert @category.valid?
  end

  test "category must have a name" do
    @category.name = nil
    refute @category.valid?
  end

  test "dependent menu items are destroyed" do
    @category.save
    @category.menu_items.create(
      name: "some item",
      description: "some item description",
      price: 10,
      display_sequence_number: 1
    )
    assert @category.menu_items.count == 1
    @category.destroy
    assert @category.menu_items.count == 0
  end
end
