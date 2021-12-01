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

  @spec read_numbers(Path.t()) :: [integer()]
  def read_numbers(path) do
    path
    |> File.stream!()
    |> Enum.map(&String.trim_trailing/1)
    |> Enum.map(&String.to_integer/1)
  end
end
