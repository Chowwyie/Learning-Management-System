# frozen_string_literal: true

require 'test_helper'

class PresentationTest < ActiveSupport::TestCase
  def setup
    @presentation = Presentation.new(name: 'Middleman Project', duedate: DateTime.now, pointvalue: 100)
  end

  test 'should be valid' do
    assert @presentation.valid?
  end

  test 'name should be present' do
    @presentation.name = ''
    assert_not @presentation.valid?
  end

  test 'name should not be too long' do
    @presentation.name = 'a' * 51
    assert_not @presentation.valid?
  end

  test 'point value must be greater than 0' do
    @presentation.pointvalue = -1
    assert_not @presentation.valid?
    @presentation.pointvalue = 100
    assert @presentation.valid?
    @presentation.pointvalue = 0
    assert @presentation.valid?
  end

  test 'grade defaults as null' do
    assert_nil @presentation.grade
  end

  test 'submission defaults to false' do
    assert_not @presentation.submitted?
  end
end
