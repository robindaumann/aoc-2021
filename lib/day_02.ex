defmodule Day02 do
  def part1(path) do
    solve(path, {0, 0}, &step/2) |> Tuple.product()
  end

  def part2(path) do
    solve(path, {0, 0, 0}, &step2/2) |> Tuple.delete_at(2) |> Tuple.product()
  end

  defp solve(path, start, step) do
    Input.lines(path)
    |> Enum.map(&parse/1)
    |> Enum.reduce(start, step)
  end

  def parse(command) do
    [dir, amount] = String.split(command, " ")
    {dir, String.to_integer(amount)}
  end

  def step({"forward", dx}, {x, y}), do: {x + dx, y}
  def step({"up", dy}, {x, y}), do: {x, y - dy}
  def step({"down", dy}, {x, y}), do: {x, y + dy}

  def step2({"forward", dx}, {x, y, aim}), do: {x + dx, y + aim * dx, aim}
  def step2({"up", dy}, {x, y, aim}), do: {x, y, aim - dy}
  def step2({"down", dy}, {x, y, aim}), do: {x, y, aim + dy}
end
