require 'test_helper'

class LocationTest < ActiveSupport::TestCase
  def setup
    @location = Location.new(name: 'North Sydney', address: 'Walker St', business: Business.new)
  end

  test 'valid location' do
    assert @location.valid?
  end

  test 'invalid without name' do
    @location.name = nil
    refute @location.valid?, 'location is valid without a email'
    assert_not_nil @location.errors[:name], 'no validation error for email present'
  end

  test 'invalid without address' do
    @location.address = nil
    refute @location.valid?
    assert_not_nil @location.errors[:address]
  end
end
