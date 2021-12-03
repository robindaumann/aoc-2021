defmodule Aoc do
  defmacro path(suffix \\ ".txt") do
    quote do
      Path.join([
        File.cwd!(),
        "input",
        Path.basename(__ENV__.file, "_test.exs") <> unquote(suffix)
      ])
    end
  end

  defmacro example(n \\ "") do
    quote do
      Aoc.path("_min#{unquote(n)}.txt")
    end
  end

  @spec lines(Path.t()) :: [String.t()]
  def lines(path) do
    File.stream!(path) |> Enum.map(&String.trim_trailing/1)
  end

  @spec read_numbers(Path.t(), 2..36) :: [integer()]
  def read_numbers(path, base \\ 10) do
    lines(path) |> Enum.map(&String.to_integer(&1, base))
  end

  @spec transpose([list]) :: [list]
  def transpose(rows) do
    rows
    |> List.zip()
    |> Enum.map(&Tuple.to_list/1)
  end
end
