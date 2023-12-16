require_relative 'day14'
require 'test/unit'

class Testday14A < Test::Unit::TestCase
  def test_example_day14_A
    result = day14A 'day14/test.txt'
    assert_equal 136, result
  end

  def test_puzzle_day14_A
    result = day14A 'day14/in.txt'
    assert_equal 110_274, result
  end

  # def test_example_day14_B
  #   result = day14B 'day14/test.txt'
  #   assert_equal 400, result
  # end

  # def test_puzzle_day14_B
  #   result = day14B 'day14/in.txt'
  #   assert_equal 32_069, result
  # end
end
