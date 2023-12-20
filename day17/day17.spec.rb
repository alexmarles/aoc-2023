require_relative 'day17'
require 'test/unit'

class TestDay17A < Test::Unit::TestCase
  def test_example_day17_A
    result = day17A 'day17/test.txt'
    assert_equal 102, result
  end

  # def test_puzzle_day17_A
  #   result = day17A 'day17/in.txt'
  #   assert_equal 755, result # 22 minutes
  # end

  def test_example_day17_B
    result = day17B 'day17/test.txt'
    assert_equal 94, result

    result = day17B 'day17/test2.txt'
    assert_equal 71, result
  end

  # def test_puzzle_day17_B
  #   result = day17B 'day17/in.txt'
  #   assert_equal 881, result # 165 minutes
  # end
end
