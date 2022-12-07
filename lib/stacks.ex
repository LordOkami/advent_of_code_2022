defmodule AdventOfCode2022.Stacks do
  @doc """
  función que lee el input de los stacks y lo convierte en una mapa con cada uno de los stacks
  """


  def parse_stacks(input) do
    input
    |> String.split("\n")
    |> Enum.drop(-1)
    |> Enum.reverse()
    |> Enum.map(   fn char ->
      char
      |> to_charlist()
      |> Enum.chunk_every(4)
      |>Enum.map(&to_letters(&1))
    end)
    |> IO.inspect()
  end

  defp to_letters(str) do
    str
    |> to_string()
    |> String.replace(" ", "")
    |> String.replace("[", "")
    |> String.replace("]", "")
  end

  def calculate(file_path) do
    [stacks, instructions] =
      file_path
      |> File.read!()
      |> String.split("\n\n")

  end
end
