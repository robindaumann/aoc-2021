defmodule Day01Test do
  use ExUnit.Case, async: true
  require Input

  test "part1 input" do
    f = Input.path()
    assert Day01.part1(f) == 1752
  end

  test "part1 example" do
    f = Input.example()
    assert Day01.part1(f) == 7
  end

  test "part2 input" do
    f = Input.path()
    assert Day01.part2(f) == 1781
  end

  test "part2 example" do
    f = Input.example()
    assert Day01.part2(f) == 5
  end
end
