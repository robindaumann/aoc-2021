defmodule Day10Test do
  use ExUnit.Case, async: true
  require Aoc

  test "part1 input" do
    f = Aoc.path()
    assert Day10.part1(f) == 436_497
  end

  test "part1 example" do
    f = Aoc.example()
    assert Day10.part1(f) == 26397
  end

  test "part2 input" do
    f = Aoc.path()
    assert Day10.part2(f) == 2_377_613_374
  end

  test "part2 example" do
    f = Aoc.example()
    assert Day10.part2(f) == 288_957
  end
end
