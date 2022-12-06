# frozen_string_literal: true

require 'test_helper'

class EvaluationTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end

  def setup
    @eval = evaluations(:one)
  end

  test 'belongs to user' do
    assert_not_nil @eval.user
  end

  test 'belongs to presentation' do
    assert_not_nil @eval.presentation
  end
end
