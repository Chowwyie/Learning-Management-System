# frozen_string_literal: true

require 'test_helper'

class AnnouncementTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
  def setup
    @announcement = announcements(:one)
  end

  test 'belongs to user' do
    assert_not_nil @announcement.user
  end

  test 'announcement has text' do
    assert_not_nil @announcement.text
  end
end
