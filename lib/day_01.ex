defmodule Day01 do
  def part1(path) do
    Input.read_numbers(path) |> num_incs
  end

  defp num_incs(ns) do
    Enum.reduce(ns, {0, 0xFFFF}, &count_inc/2) |> elem(0)
  end

  defp count_inc(x, {count, lst}) when x > lst, do: {count + 1, x}
  defp count_inc(x, {count, _}), do: {count, x}

  def part2(path) do
    Input.read_numbers(path) |> sum_window |> num_incs
  end

  defp sum_window([a, b, c | _] = ns), do: [a + b + c | sum_window(tl(ns))]
  defp sum_window(_), do: []
end
