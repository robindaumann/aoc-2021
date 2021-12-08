defmodule Day07Test do
  use ExUnit.Case, async: true
  require Aoc

  test "part1 input" do
    f = Aoc.path()
    assert Day07.part1(f) == 342_534
  end

  test "part1 example" do
    f = Aoc.example()
    assert Day07.part1(f) == 37
  end

  test "part2 input" do
    f = Aoc.path()
    assert Day07.part2(f) == 94_004_208
  end

  test "part2 example" do
    f = Aoc.example()
    assert Day07.part2(f) == 168
  end
end
