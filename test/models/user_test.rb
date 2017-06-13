require 'test_helper'

class UserTest < ActiveSupport::TestCase
  test '#display_name when admin' do
    user = User.new(admin: true, name: 'Bob')

    assert_equal 'Bob (admin)', user.display_name
  end

  test '#display_name when not admin' do
    user = User.new(admin: false, name: 'Bob')

    assert_equal 'Bob', user.display_name
  end
  
  test 'ensures that password length is min 8' do
     user = User.new(password: '1234567')
 
     assert_not user.valid?
     assert_equal [:password], user.errors.keys
   end

end
