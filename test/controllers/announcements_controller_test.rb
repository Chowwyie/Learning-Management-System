# frozen_string_literal: true

require 'test_helper'

class AnnouncementsControllerTest < ActionDispatch::IntegrationTest
  # test "the truth" do
  #   assert true
  # end

  def setup
    @announcement = announcements(:one)
  end

  test 'should redirect view when not authenticated' do
    get announcements_path
    assert_redirected_to root_url
  end

  test 'should redirect edit when ont authenticated' do
    get edit_announcement_path(@announcement.id)
    assert_redirected_to root_url
  end

  test 'should redirect delete when not authenticated' do
    delete announcement_path(@announcement.id)
    assert_redirected_to announcements_path
  end
end
