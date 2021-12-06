defmodule Day05 do
  def part1(path) do
    count_overlaps(path, fn [x1, y1, x2, y2] -> x1 == x2 or y1 == y2 end)
  end

  def part2(path) do
    count_overlaps(path, fn _ -> true end)
  end

  defp count_overlaps(path, filter) do
    Aoc.lines(path)
    |> Enum.map(&parse_line/1)
    |> Enum.filter(filter)
    |> Enum.flat_map(&trace/1)
    |> Enum.frequencies()
    |> Enum.count(fn {_key, freq} -> freq > 1 end)
  end

  defp parse_line(line) do
    Regex.run(~r/(\d+),(\d+) -> (\d+),(\d+)/, line, capture: :all_but_first)
    |> Enum.map(&String.to_integer/1)
  end

  @spec trace([integer()]) :: list
  def trace([x1, y1, x2, y2]) do
    dx = x1..x2
    dy = y1..y2

    if Range.size(dx) > Range.size(dy) do
      dy = Stream.cycle(dy)
      Enum.zip(dx, dy)
    else
      dx = Stream.cycle(dx)
      Enum.zip(dx, dy)
    end
  end
end
