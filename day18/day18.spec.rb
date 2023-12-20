require_relative 'day18'
require 'test/unit'

class TestDay18A < Test::Unit::TestCase
  def test_example_day18_A
    result = day18A 'day18/test.txt'
    assert_equal 62, result
  end

  def test_puzzle_day18_A
    result = day18A 'day18/in.txt'
    assert_equal 40_761, result
  end

  # def test_example_day18_B
  #   result = day18B 'day18/test.txt'
  #   assert_equal 51, result
  # end

  # def test_puzzle_day18_B
  #   result = day18B 'day18/in.txt'
  #   assert_equal 8143, result
  # end
end
