require 'test_helper'

class LocationTest < ActiveSupport::TestCase
  def setup
    @business = businesses(:one)
    @location = 
      Location.new(
        name: "some location",
        address: "some address",
        business_id: @business.id,
        location_url: "some-location"
      )
  end

  test 'valid location' do
    assert @location.valid?
  end

  test 'name is required' do
    @location.name = nil
    refute @location.valid?, 'location is valid without a name'
  end

  test "name is unique for locations in the business" do
    @location.name        = "some name"
    assert @location.save
    @second_location      = @location.dup
    @second_location.id   = nil
    refute @second_location.valid?
    @second_location.name = "something else"
    assert @second_location.valid?
  end

  test 'address is required' do
    @location.address = nil
    refute @location.valid?
  end

  test "location url is converted" do
    @location.name = "some location"
    @location.save
    assert @location.location_url == "some-location"
  end

  test "address is geocoded" do
    
  end
end
