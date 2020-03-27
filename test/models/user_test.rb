require 'test_helper'

class UserTest < ActiveSupport::TestCase
  def setup
    @business = businesses(:one)
    @user =
      User.new(
        email:       "example@example",
        password:    "password",
        business_id: @business.id
      )
  end

  test 'valid user' do
    assert @user.valid?
  end

  test 'doesnt save without email' do
    @user.email = nil
    refute @user.save
  end

  test 'doesnt save without password' do
    @user.password = nil
    refute @user.save
  end
end
