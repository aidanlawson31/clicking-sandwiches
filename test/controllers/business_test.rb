require 'test_helper'

class BusinessControllerTest < ActionDispatch::IntegrationTest

	def setup
		@business = businesses(:one)
	end

	test "should get business index" do
    sign_in users(:user_one)
		get business_url(@business.id)
		assert_response :success
	end

	test "should redirect to login" do
		get business_url(@business.id)
		assert_response :redirect
	end
end
