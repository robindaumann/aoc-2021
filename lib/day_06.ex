defmodule Day06 do
  import Enum

  def part1(path) do
    evolve(path, 80)
  end

  def part2(path) do
    evolve(path, 256)
  end

  defp evolve(path, times) do
    Aoc.read_numbers(path, ",")
    |> reduce(List.duplicate(0, 9), &list_freq/2)
    |> propagate(times)
    |> sum()
  end

  defp list_freq(fish, freq) do
    List.update_at(freq, fish, &(&1 + 1))
  end

  defp propagate(fish, 0), do: fish

  defp propagate([next | fish], times) do
    (fish ++ [next])
    |> List.update_at(6, &(&1 + next))
    |> propagate(times - 1)
  end
end
