defmodule Day03 do
  def part1(path) do
    parse(path)
    |> bit_frequencies()
    |> Enum.reduce(["", ""], &find_ye/2)
    |> Enum.map(&String.to_integer(&1, 2))
    |> Enum.product()
  end

  def part2(path) do
    ratings = parse(path)

    [&choose_oxygen/1, &choose_co2/1]
    |> Enum.map(fn choose_bit ->
      find_rating(ratings, choose_bit, 0)
      |> Enum.join()
      |> String.to_integer(2)
    end)
    |> Enum.product()
  end

  defp parse(path) do
    Aoc.lines(path)
    |> Enum.map(&String.graphemes/1)
  end

  defp bit_frequencies(ratings) do
    ratings
    |> Aoc.transpose()
    |> Enum.map(&Enum.frequencies/1)
  end

  defp find_ye(%{"0" => zeros, "1" => ones}, [y, e]) when zeros > ones do
    [y <> "0", e <> "1"]
  end

  defp find_ye(_, [y, e]), do: [y <> "1", e <> "0"]

  defp choose_oxygen(%{"0" => zeros, "1" => ones}) when zeros > ones, do: "0"
  defp choose_oxygen(_), do: "1"

  defp choose_co2(%{"0" => zeros, "1" => ones}) when zeros > ones, do: "1"
  defp choose_co2(_), do: "0"

  defp find_rating([rating], _, _), do: rating

  defp find_rating(ratings, choose_bit, bitpos) do
    bit = bit_frequencies(ratings) |> Enum.fetch!(bitpos) |> choose_bit.()

    Enum.filter(ratings, fn rating -> Enum.fetch!(rating, bitpos) == bit end)
    |> find_rating(choose_bit, bitpos + 1)
  end
end
