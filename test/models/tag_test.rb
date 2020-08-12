require 'test_helper'

class TagTest < ActiveSupport::TestCase
  def setup
    @tag = tags(:one)
  end

  test "name is required" do
    assert @tag.valid?
    @tag.name = nil
    refute @tag.valid?
  end
end
