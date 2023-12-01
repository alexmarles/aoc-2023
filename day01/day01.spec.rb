require_relative 'day01'
require 'test/unit'

class TestDay01A < Test::Unit::TestCase
    def test_example_day01_A
        result = day01A 'day01/exampleData'
        assert_equal result, 142
    end

    def test_puzzle_day01_A
        result = day01A 'day01/inputData'
        assert_equal result, 53334
    end

    # def test_example_day01_B
    #     result = day01B 'day01/exampleData'
    #     assert_equal result, 45000
    # end

    # def test_puzzle_day01_B
    #     result = day01B 'day01/inputData'
    #     assert_equal result, 206152
    # end
end
