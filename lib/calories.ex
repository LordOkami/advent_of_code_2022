defmodule AdventOfCode2022.Calories do
  @moduledoc """
  Documentation for `AdventOfCode2022`.
  """

  defp get_elves_calories([], result, max_values) do
    max_values ++ [result]
  end

  defp get_elves_calories([head | tail], result, max_values) do
    case Integer.parse(head) do
      {number, ""} ->
        get_elves_calories(tail, result + number, max_values)
      _ ->
        get_elves_calories(tail, 0, max_values ++ [result])
    end
  end

  def get_top_elf_calories(file_path, number_of_elves) do
    File.read!(file_path)
    |> String.split("\n")
    |> get_elves_calories(0, [])
    |> IO.inspect()
    |> Enum.sort(:desc)
    |> Enum.take(number_of_elves)
    |> Enum.sum()
  end
end
