# frozen_string_literal: true

require 'test_helper'

class UsersControllerTest < ActionDispatch::IntegrationTest
  def setup
    @user_admin = users(:charlie)
    @userstudent1 = users(:eddie)
    @userstudent2 = users(:alan)
  end

  test 'should get new' do
    get signup_path
    assert_response :success
  end

  test 'should redirect when not logged in' do
    get users_path
    assert_redirected_to root_url
  end

  test 'should redirect to users delete when not logged in' do
    delete user_path(1)
    assert_redirected_to users_url
  end
end
