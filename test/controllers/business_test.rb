require 'test_helper'

class BusinessControllerTest < ActionDispatch::IntegrationTest
	
	def setup
		@business = businesses(:one)
	end

	test "should redirect to login" do
		get business_url(@business.id)
		assert_response :redirect
	end
end
