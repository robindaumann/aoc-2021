defmodule Day10 do
  def part1(path) do
    scores = %{
      ?) => 3,
      ?] => 57,
      ?} => 1197,
      ?> => 25137
    }

    analyse(path)
    |> Enum.filter(&not_matching?/1)
    |> Enum.map(fn {_, bad_char} -> Map.fetch!(scores, bad_char) end)
    |> Enum.sum()
  end

  defp analyse(path) do
    Aoc.lines(path) |> Enum.map(&check_matching(&1))
  end

  defp check_matching(_line, _cur_char \\ [])

  defp check_matching("", []), do: :ok

  defp check_matching("", opened), do: {:missing_closing, opened}

  defp check_matching(<<open, line::binary>>, opened) when open in [?[, ?(, ?{, ?<] do
    check_matching(line, [open | opened])
  end

  defp check_matching(<<close, line::binary>>, [open | opened]) when close in [?], ?), ?}, ?>] do
    pairs = %{
      ?[ => ?],
      ?( => ?),
      ?{ => ?},
      ?< => ?>
    }

    if Map.fetch!(pairs, open) != close do
      {:not_matching, close}
    else
      check_matching(line, opened)
    end
  end

  defp not_matching?({:not_matching, _}), do: true
  defp not_matching?({:missing_closing, _}), do: false

  def part2(path) do
    analyse(path)
    |> Enum.reject(&not_matching?/1)
    |> Enum.map(&missing_score/1)
    |> Aoc.median()
  end

  defp missing_score({:missing_closing, missing}) do
    scores = %{
      ?( => 1,
      ?[ => 2,
      ?{ => 3,
      ?< => 4
    }

    Enum.reduce(missing, 0, fn c, acc -> acc * 5 + Map.fetch!(scores, c) end)
  end
end
