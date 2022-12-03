defmodule AdventOfCode2022.Calories do
  ## Part 1
  defp get_max([], _, max_value) do
    max_value
  end

  defp get_max([head | tail], result, max_value) do
    case head do
      "" ->
        get_max(tail, 0, max(result, max_value))

      _ ->
        {number, ""} = Integer.parse(head)
        get_max(tail, result + number, max_value)
    end
  end

  # Part 2
  defp get_elves_calories([], _, max_values) do
    max_values
  end

  defp get_elves_calories([head | tail], result, max_values) do
    case head do
      "" ->
        get_elves_calories(tail, 0, max_values ++ [result])

      _ ->
        {number, ""} = Integer.parse(head)
        get_elves_calories(tail, result + number, max_values)
    end
  end

  def get_top_elf_calories(file_path, number_of_elves) do
    File.read!(file_path)
    |> String.split("\n")
    |> IO.inspect()
    |> get_elves_calories(0, [])
    |> Enum.sort(:desc)
    |> Enum.take(number_of_elves)
    |> Enum.reduce(fn x, acc -> x + acc end)
  end
end
