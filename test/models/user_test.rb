require 'test_helper'

class UserTest < ActiveSupport::TestCase
  def setup
    @user = User.new(email: 'john@smitty.com', password: 'qwerty123')
  end

  test 'valid user' do
    assert @user.valid?
  end

  test 'invalid without email' do
    @user.password = nil
    refute @user.valid?, 'user is valid without a email'
    assert_not_nil @user.errors[:email], 'no validation error for email present'
  end

  test 'invalid without password' do
    @user.email = nil
    refute @user.valid?
    assert_not_nil @user.errors[:password]
  end
end
