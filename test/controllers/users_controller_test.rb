require "test_helper"

class UsersControllerTest < ActionDispatch::IntegrationTest
  def setup
    @user_admin = users(:charlie)
    @user_student_1 = users(:eddie)
    @user_student_2 = users(:alan)
  end

  test "should get new" do
     get signup_path
     assert_response :success
  end

  # test "delete action follows admin logic" do
  #   log_in_as(@user_admin)
  #   get users_path
  #   assert_template 'users/index'
  # end

end
