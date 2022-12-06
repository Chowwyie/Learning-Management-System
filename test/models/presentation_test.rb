require "test_helper"

class PresentationTest < ActiveSupport::TestCase
  def setup
    @presentation = Presentation.new(name: "Middleman Project")
  end

  test "should be valid" do
    assert @presentation.valid?
  end

  test "name should be present" do
    @presentation.name = ""
    assert_not @presentation.valid?
  end

  test "name should not be too long" do
    @presentation.name = "a" * 51
    assert_not @presentation.valid?
  end

  test "grade must be between 0 and 100" do
    @presentation.grade = 101
    assert_not @presentation.valid?
    @presentation.grade = -1
    assert_not @presentation.valid?
    @presentation.grade = 50
    assert @presentation.valid?
  end

  test "grade defaults as null" do
    assert_nil @presentation.grade
  end

  test "submission defaults to false" do
    assert_not @presentation.submitted?
  end
end
