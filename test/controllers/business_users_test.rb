require 'test_helper'

class BusinessUsersControllerTest < ActionDispatch::IntegrationTest
  def setup
    @business       = businesses(:one)
    @admin_user     = users(:admin_user)
    @not_admin_user = users(:not_admin_user)
  end

	test 'should redirect to login' do
		get business_business_users_url(@business)
		assert_response :redirect
	end
  
  test 'should get user access when admin' do
    sign_in @admin_user
    get business_business_users_url(@business)
    assert_response :success
    assert_template "business_users/index"
  end

  test 'should get user access when not admin' do
    sign_in @not_admin_user
    get business_business_users_url(@business)
    assert_response :success
    assert_template "business_users/index"
  end

  test 'should create user as admin' do
    sign_in @admin_user
    post business_business_users_url(@business, "user" => {
      "email"                 => "tuser+5234@example.com",
      "password"              => "password",
      "password_confirmation" => "password",
      "admin"                 => "true",
      "business_id"           => "35",
      "first_name"            => "test",
      "last_name"             => "user"
    })
    business_user = User.find_by(email: "tuser+5234@example.com")
    assert business_user
    if business_user
      assert business_user.email == "tuser+5234@example.com"
    end
  end

  test 'admin can change admin status of another user' do
    sign_in @admin_user
    patch grant_admin_privileges_business_business_user_url(@business.id, @not_admin_user.id, "user" => {"admin" => "true"}, "id"=> @not_admin_user.id)
		assert User.find_by(id: @not_admin_user.id)&.admin?
  end

  test 'non admins arent permitted to change the admin status of another user' do
    sign_in @not_admin_user
    patch remove_admin_privileges_business_business_user_url(@business, @admin_user, "user" => {
      "admin" => "false"
    })
    assert_response :unauthorized
  end

  test 'admin can delete another user' do
    sign_in @admin_user
    delete business_business_user_url(@business.id, @not_admin_user.id)
		refute User.find_by(id: @not_admin_user.id)
  end

  test 'non admins cannot delete another user' do
    sign_in @not_admin_user
    delete business_business_user_url(@business.id, @admin_user.id)
    assert_response :unauthorized
  end
end
