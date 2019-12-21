require 'test_helper'

class CarsControllerTest < ActionDispatch::IntegrationTest
  test "should get brand:string" do
    get cars_brand:string_url
    assert_response :success
  end

  test "should get model:string" do
    get cars_model:string_url
    assert_response :success
  end

  test "should get spec:string" do
    get cars_spec:string_url
    assert_response :success
  end

end
