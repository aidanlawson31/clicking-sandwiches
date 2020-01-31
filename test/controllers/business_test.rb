require 'test_helper'
 
class BusinessTest < ActiveSupport::TestCase
  test "should not save business without business information" do
    business = Business.new
    assert_not business.save, "didnt save the business without business information"
  end

  test "should save business with business information" do
    business = businesses(:burgers)
    assert business.save, "saved the business with business information"
  end
end
