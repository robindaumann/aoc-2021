defmodule Day04Test do
  use ExUnit.Case, async: true
  require Aoc

  test "part1 input" do
    f = Aoc.path()
    assert Day04.part1(f) == 33348
  end

  test "part1 example" do
    f = Aoc.example()
    assert Day04.part1(f) == 4512
  end

  test "part2 input" do
    f = Aoc.path()
    assert Day04.part2(f) == 8112
  end

  test "part2 example" do
    f = Aoc.example()
    assert Day04.part2(f) == 1924
  end
end
