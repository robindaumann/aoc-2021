defmodule Day07 do
  def part1(path) do
    crabs = Aoc.read_numbers(path, ",")
    median(crabs) |> fuel_const(crabs) |> Enum.sum()
  end

  def part2(path) do
    crabs = Aoc.read_numbers(path, ",")
    mean = mean(crabs)
    [mean, mean + 1] |> Enum.map(&fuel_inc(&1, crabs)) |> Enum.min()
  end

  defp fuel_const(alignment, crabs) do
    Enum.map(crabs, fn crab -> abs(crab - alignment) end)
  end

  def fuel_inc(alignment, crabs) do
    fuel_const(alignment, crabs) |> Enum.map(&triangular_n/1) |> Enum.sum()
  end

  defp triangular_n(n), do: div(n * (n + 1), 2)

  defp mean(l) do
    Enum.sum(l) |> div(length(l))
  end

  defp median(l) when rem(length(l), 2) != 0 do
    raise "median only implement for even list lengths"
  end

  defp median(l) do
    mid = div(length(l), 2)
    Enum.sort(l) |> Enum.fetch!(mid)
  end
end
