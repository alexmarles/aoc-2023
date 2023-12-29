require_relative 'day24'
require 'test/unit'

class TestDay24A < Test::Unit::TestCase
  def test_example_day24_A
    result = day24A 'day24/test.txt', 7, 27
    assert_equal 2, result
  end

  def test_puzzle_day24_A
    result = day24A 'day24/in.txt', 200_000_000_000_000, 400_000_000_000_000
    assert_equal 29_142, result
  end

  def test_example_day24_B
    omit 'Solved using MATLAB'
    result = day24B 'day24/test.txt'
    assert_equal 47, result
  end

  def test_puzzle_day24_B
    omit 'Solved using MATLAB'
    result = day24B 'day24/in.txt'
    assert_equal 848_947_587_263_033, result
  end
end
