defmodule Day05Test do
  use ExUnit.Case, async: true
  require Aoc

  test "part1 input" do
    f = Aoc.path()
    assert Day05.part1(f) == 8350
  end

  test "part1 example" do
    f = Aoc.example()
    assert Day05.part1(f) == 5
  end

  test "part2 input" do
    f = Aoc.path()
    assert Day05.part2(f) == 19374
  end

  test "part2 example" do
    f = Aoc.example()
    assert Day05.part2(f) == 12
  end

  test "trace line horizontal" do
    assert Day05.trace([1,4,3,4]) == [{1,4},{2,4},{3,4}]
  end

  test "trace line vertical" do
    assert Day05.trace([0,3,0,1]) == [{0,3},{0,2},{0,1}]
  end

  test "trace line diagonal" do
    assert Day05.trace([1,1,3,3]) == [{1,1},{2,2},{3,3}]
  end
end
