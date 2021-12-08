defmodule Day06Test do
  use ExUnit.Case, async: true
  require Aoc

  test "part1 input" do
    f = Aoc.path()
    assert Day06.part1(f) == 356_190
  end

  test "part1 example" do
    f = Aoc.example()
    assert Day06.part1(f) == 5934
  end

  test "part2 input" do
    f = Aoc.path()
    assert Day06.part2(f) == 1_617_359_101_538
  end

  test "part2 example" do
    f = Aoc.example()
    assert Day06.part2(f) == 26_984_457_539
  end
end
