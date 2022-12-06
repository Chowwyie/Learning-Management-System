# frozen_string_literal: true

require 'test_helper'

class SessionsControllerTest < ActionDispatch::IntegrationTest
  test 'should get new' do
    get sessions_new_url
    assert_response :success
  end

  test 'should create new session' do
    post login_path, params: { session: { email: 'charlie@test.com', password: 'password' } }
    assert_response :unprocessable_entity
  end

  test 'should log out' do
    delete logout_path
    assert_redirected_to root_url
  end
end
