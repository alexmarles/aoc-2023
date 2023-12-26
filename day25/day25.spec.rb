require_relative 'day25'
require 'test/unit'

class TestDay25A < Test::Unit::TestCase
  def test_example_day25_A
    result = day25A 'day25/test.txt'
    assert_equal 54, result
  end

  def test_puzzle_day25_A
    result = day25A 'day25/in.txt'
    assert_equal 538_368, result
  end
end
