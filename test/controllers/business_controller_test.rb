require 'test_helper'

class BusinessControllerTest < ActionDispatch::IntegrationTest
	
	def setup
		@business = businesses(:one)
		@user 		= users(:user_one)
	end

	test "should redirect to login" do
		get business_url(@business.id)
		assert_response :redirect
	end

	test "should render business show" do
		sign_in @user
		get business_url(@business.id)
		assert_response :success
	end

	test "business create should create a business display attribute" do
		sign_in @user
		business = Business.create(
			name: "testb",
			business_url: "testburl"
		)
		assert BusinessDisplayAttribute.find_by(business_id: business.id)
	end

	test "should be able to update a business display attribtue" do
		sign_in @user
		@business_display_attribute = business_display_attributes(:one)
		assert @business_display_attribute.primary_color == "one"
		patch update_business_display_attribute_business_url(@business.id, "business_display_attribute" => {"primary_color" => "#000"}, "id"=> @business_display_attribute.id)
		@business_display_attribute.reload
		assert @business_display_attribute.primary_color == "#000"
	end
end
