require 'test_helper'

class FontTest < ActiveSupport::TestCase
  def setup
    @font = Font.new(name: 'some font')
  end

  test "valid font" do
    assert @font.valid?
  end

  test "name is required" do
    @font.name = nil
    refute @font.valid?
  end

  test "default is found" do
    assert Font.default != nil 
  end
end
