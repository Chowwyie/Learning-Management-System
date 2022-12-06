# frozen_string_literal: true

require 'test_helper'

class PresentationsControllerTest < ActionDispatch::IntegrationTest
  def setup
    @pres = presentations(:one)
  end

  test 'should be authenticated for presentations' do
    get presentations_path
    assert_redirected_to(controller: 'static_pages', action: 'home')
  end

  test 'should be authenticated for new presentation' do
    get new_presentation_path
    assert_redirected_to root_url
  end

  test 'should be authenticated for delete presentation' do
    delete presentation_path(@pres.id)
    assert_redirected_to presentations_url
  end
  test 'should be authenticated for edit presentation' do
    get edit_presentation_path(@pres.id)
    assert_redirected_to root_url
  end
end
