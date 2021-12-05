defmodule Day04 do
  def part1(path) do
    {grids, draws} = parse(path)

    # the grid width and height is fixed at 5
    {grid, drawn_ns} = win_bingo(grids, draws, 5)

    score(grid, drawn_ns)
  end

  def part2(path) do
    {grids, draws} = parse(path)

    {grid, drawn_ns} = loose_bingo(grids, draws, 5)

    score(grid, drawn_ns)
  end

  defp parse(path) do
    [[draws] | lines] =
      Aoc.lines(path)
      |> Enum.chunk_by(fn line -> line == "" end)

    draws =
      String.split(draws, ",")
      |> Enum.map(&String.to_integer/1)

    grids =
      Enum.reject(lines, fn line -> line == [""] end)
      |> Enum.map(&parse_grid/1)
      # put rows and columns in a list
      |> Enum.map(fn grid -> grid ++ Aoc.transpose(grid) end)

    {grids, draws}
  end

  defp parse_grid(lines) do
    lines
    |> Enum.map(&String.split(&1, ~r/\s+/))
    |> Enum.map(fn row -> Enum.map(row, &String.to_integer/1) end)
  end

  defp win_bingo(grids, draws, take) do
    drawn_ns = Enum.take(draws, take)

    case Enum.find(grids, &grid_winning?(&1, drawn_ns)) do
      nil -> win_bingo(grids, draws, take + 1)
      grid -> {grid, drawn_ns}
    end
  end

  defp loose_bingo(grids, draws, take) do
    drawn_ns = Enum.take(draws, take)

    case Enum.reject(grids, &grid_winning?(&1, drawn_ns)) do
      [] -> {hd(grids), drawn_ns}
      grids -> loose_bingo(grids, draws, take + 1)
    end
  end

  defp grid_winning?(grid, drawn_ns) do
    Enum.any?(grid, fn row -> Enum.empty?(row -- drawn_ns) end)
  end

  defp score(grid, drawn_ns) do
    # grid contained rows and columns, therefore drop columns again
    half = div(Enum.count(grid), 2)
    rows = Enum.drop(grid, half)

    Enum.sum(List.flatten(rows) -- drawn_ns) * List.last(drawn_ns)
  end
end
