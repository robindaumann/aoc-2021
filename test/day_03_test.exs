defmodule Day03Test do
  use ExUnit.Case, async: true
  require Aoc

  test "part1 input" do
    f = Aoc.path()
    assert Day03.part1(f) == 3_687_446
  end

  test "part1 example" do
    f = Aoc.example()
    assert Day03.part1(f) == 198
  end

  test "part2 input" do
    f = Aoc.path()
    assert Day03.part2(f) == 4_406_844
  end

  test "part2 example" do
    f = Aoc.example()
    assert Day03.part2(f) == 230
  end
end
