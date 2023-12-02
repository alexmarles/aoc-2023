require_relative 'day02'
require 'test/unit'

class TestDay02A < Test::Unit::TestCase
  def test_example_day02_A
    result = day02A 'day02/exampleData'
    assert_equal result, 8
  end

  def test_puzzle_day02_A
    result = day02A 'day02/inputData'
    assert_equal result, 2105
  end

  # def test_example_day02_B
  #   result = day02B 'day02/exampleData2'
  #   assert_equal result, 281
  # end

  # def test_puzzle_day02_B
  #   result = day02B 'day02/inputData'
  #   assert_equal result, 52_834
  # end
end
