defmodule Input do
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
      Input.path("_min#{unquote(n)}.txt")
    end
  end

  @spec lines(Path.t()) :: [String.t()]
  def lines(path) do
    File.stream!(path) |> Enum.map(&String.trim_trailing/1)
  end

  @spec read_numbers(Path.t()) :: [integer()]
  def read_numbers(path) do
    lines(path) |> Enum.map(&String.to_integer/1)
  end
end
