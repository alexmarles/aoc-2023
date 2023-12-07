require_relative 'day07'
require 'test/unit'

class Testday07A < Test::Unit::TestCase
  def test_example_day07_A
    result = day07A 'day07/test.txt'
    assert_equal 6440, result
  end

  def test_puzzle_day07_A
    result = day07A 'day07/in.txt'
    assert_equal 241_344_943, result
  end

  # def test_example_day07_B
  #   result = day07B 'day07/test.txt'
  #   assert_equal 71_503, result
  # end

  # def test_puzzle_day07_B
  #   result = day07B 'day07/in.txt'
  #   assert_equal 28_545_089, result
  # end
end
