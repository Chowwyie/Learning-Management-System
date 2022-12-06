# frozen_string_literal: true

require 'test_helper'

class TeamTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end

  def setup
    @team = teams(:one)
  end

  test 'belongs to a user' do
    assert_not_nil @team.user
  end

  # test "can have multiple users" do
  #   assert_difference @team.index_teams_on_user_id.length, 1 do
  #     @team.users.push(:alan)
  #   end
  # end

  test 'belongs to a presentation' do
    assert_not_nil @team.presentation
  end
end
