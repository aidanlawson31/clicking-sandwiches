require 'test_helper'

class MenuItemOptionTest < ActiveSupport::TestCase
  def setup 
    @option = menu_item_options(:one)
  end

  test "option is valid" do
    assert @option.valid?
  end

  test "name is required" do
    @option.name = nil
    refute @option.valid?
  end

  test "dislay sequence number is required" do
    @option.display_sequence_number = nil
    refute @option.valid?
  end
end
