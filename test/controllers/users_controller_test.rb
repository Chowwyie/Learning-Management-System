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

  # test "delete action follows admin logic" do
  #   log_in_as(@user_admin)
  #   get users_path
  #   assert_template 'users/index'
  # end
end
