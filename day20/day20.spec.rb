require_relative 'day20'
require 'test/unit'

class TestDay20A < Test::Unit::TestCase
  def test_example_day20_A
    result = day20A 'day20/test.txt'
    assert_equal 32_000_000, result

    result = day20A 'day20/test2.txt'
    assert_equal 11_687_500, result
  end

  def test_puzzle_day20_A
    result = day20A 'day20/in.txt'
    assert_equal 812_721_756, result
  end

  def test_puzzle_day20_B
    result = day20B 'day20/in.txt'
    assert_equal 233_338_595_643_977, result
  end
end
