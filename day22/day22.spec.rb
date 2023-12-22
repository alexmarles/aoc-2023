require_relative 'day22'
require 'test/unit'

class TestDay22A < Test::Unit::TestCase
  def test_example_day22_A
    result = day22A 'day22/test.txt'
    assert_equal 5, result
  end

  def test_puzzle_day22_A
    result = day22A 'day22/in.txt'
    assert_equal 393, result
  end

  # def test_example_day22_B
  #   result = day22B 'day22/test.txt'
  #   assert_equal 167_409_079_868_000, result
  # end

  # def test_puzzle_day22_B
  #   result = day22B 'day22/in.txt'
  #   assert_equal 134_370_637_448_305, result
  # end
end
