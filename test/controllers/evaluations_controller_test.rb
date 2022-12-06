# frozen_string_literal: true

require 'test_helper'

class EvaluationsControllerTest < ActionDispatch::IntegrationTest
  # test "the truth" do
  #   assert true
  # end

  def setup
    @eval = evaluations(:one)
  end

  test 'should be authenticated for evaluations' do
    get evaluations_path
    assert_redirected_to root_url
  end

  test 'should be authenticated for deleting evaluations' do
    delete evaluation_url(@eval.id)
    assert_redirected_to root_url
  end

  test 'should be authenticated for edit evaluations' do
    get edit_evaluation_path(@eval.id)
    assert_redirected_to root_url
  end
end
