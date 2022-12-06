# frozen_string_literal: true

require 'test_helper'

class PresentationsControllerTest < ActionDispatch::IntegrationTest
  test 'should be authenticated for presentations' do
    get presentations_path
    assert_redirected_to(controller: 'static_pages', action: 'home')
  end
end
