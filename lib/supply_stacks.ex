defmodule AdventOfCode2022.SupplyStacks do
  @doc """
  función que lee el input de los stacks y lo convierte en una mapa con cada uno de los stacks
  """

  defp transpose([[] | _]), do: []

  defp transpose(m) do
    [Enum.map(m, &hd/1) | transpose(Enum.map(m, &tl/1))]
  end

  defp to_letters(str) do
    str
    |> to_string()
    |> String.replace(" ", "")
    |> String.replace("[", "")
    |> String.replace("]", "")
  end

  defp parse_int!(value) do
    case Integer.parse(value) do
      {value, ""} -> value
      error -> raise(error)
    end
  end

  defp parse_stacks(stacks) do
    stacks
    |> String.split("\n")
    |> Enum.drop(-1)
    |> Enum.reverse()
    |> Enum.map(fn char ->
      char
      |> to_charlist()
      |> Enum.chunk_every(4)
      |> Enum.map(&to_letters(&1))
    end)
    |> transpose()
    |> Enum.map(&(Enum.filter(&1, fn x -> x != "" end) |> Enum.reverse()))
  end

  defp move(stacks, [0, _, _]), do: stacks

  defp move(stacks, [times, from, to]) do
    # Get the last element of the stack from
    [item | from_list] = Enum.at(stacks, from - 1)
    to_list = [item | Enum.at(stacks, to - 1)]

    stacks
    |> List.replace_at(from - 1, from_list)
    |> List.replace_at(to - 1, to_list)
    |> move([times - 1, from, to])
  end

  defp parse_instructions(instructions) do
    instructions
    |> String.split("\n")
    |> Enum.map(fn instruction ->
      [_, times, _, from, _, to] =
        instruction
        |> String.split(" ")

      [times, from, to] |> Enum.map(&parse_int!(&1))
    end)
  end

  defp apply_instructions(initial_stacks, instructions) do
    instructions
    |> parse_instructions()
    |> Enum.reduce(initial_stacks, fn instruction, stacks ->
      stacks
      |> move(instruction)
    end)
  end

  defp get_top_elements(stacks) do
    stacks
    |> Enum.map(fn stack ->
      Enum.at(stack, 0)
    end)
    |> Enum.reduce("", fn item, acc ->
      acc <> item
    end)
  end

  def calculate(file_path) do
    [stacks, instructions] =
      file_path
      |> File.read!()
      |> String.split("\n\n")

    stacks
    |> parse_stacks()
    |> apply_instructions(instructions)
    |> get_top_elements()
  end
end
