require_relative 'day11'
require 'test/unit'

class Testday11A < Test::Unit::TestCase
  def test_example_day11_A
    result = day11A 'day11/test.txt'
    assert_equal 374, result
  end

  def test_puzzle_day11_A
    result = day11A 'day11/in.txt'
    assert_equal 9_370_588, result
  end

  def test_example_day11_B
    result = day11B 'day11/test.txt', 10
    assert_equal 1030, result
    result = day11B 'day11/test.txt', 100
    assert_equal 8410, result
  end

  def test_puzzle_day11_B
    result = day11B 'day11/in.txt', 1_000_000
    assert_equal 746_207_878_188, result
  end
end
