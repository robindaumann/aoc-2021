defmodule AocTest do
  use ExUnit.Case, async: true

  test "read numbers" do
    expect = [199, 200, 208, 210, 200, 207, 240, 269, 260, 263]
    assert Aoc.read_numbers("input/day_01_min.txt") == expect
  end
end
