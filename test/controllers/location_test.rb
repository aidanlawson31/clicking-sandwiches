require 'test_helper'

class LocationControllerTest < ActionDispatch::IntegrationTest
  def setup
    @location = locations(:one)
  end
end