require_relative 'day12'
require 'test/unit'

class Testday12A < Test::Unit::TestCase
  def test_example_day12_A
    result = day12A 'day12/test.txt'
    assert_equal 21, result
  end

  def test_puzzle_day12_A
    result = day12A 'day12/in.txt'
    assert_equal 7541, result
  end

  # def test_example_day12_B
  #   result = day12B 'day12/test.txt'
  #   assert_equal 1030, result
  #   result = day12B 'day12/test.txt'
  #   assert_equal 8410, result
  # end

  # def test_puzzle_day12_B
  #   result = day12B 'day12/in.txt'
  #   assert_equal 746_207_878_188, result
  # end
end
