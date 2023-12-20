require_relative 'day19'
require 'test/unit'

class TestDay19A < Test::Unit::TestCase
  def test_example_day19_A
    result = day19A 'day19/test.txt'
    assert_equal 19_114, result
  end

  def test_puzzle_day19_A
    result = day19A 'day19/in.txt'
    assert_equal 489_392, result
  end

  def test_example_day19_B
    result = day19B 'day19/test.txt'
    assert_equal 167_409_079_868_000, result
  end

  def test_puzzle_day19_B
    result = day19B 'day19/in.txt'
    assert_equal 134_370_637_448_305, result
  end
end
