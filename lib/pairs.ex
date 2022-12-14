defmodule AdventOfCode2022.Pairs do
  defp is_contained_by?(first_start, first_end, second_start, second_end) do
    first_start >= second_start and first_end <= second_end
  end

  defp is_solaped_by?(first_start, first_end, second_start, second_end) do
    (first_start <= second_start and first_end >= second_start) or
      (first_start <= second_end and first_end >= second_end)
  end

  defp parse_int!(value) do
    case Integer.parse(value) do
      {value, ""} -> value
      error -> raise(error)
    end
  end

  defp contains_other?(tuple) do
    [first, second] = String.split(tuple, ",")
    [first_start, first_end] = String.split(first, "-") |> Enum.map(&parse_int!(&1))
    [second_start, second_end] = String.split(second, "-") |> Enum.map(&parse_int!(&1))

    is_contained_by?(first_start, first_end, second_start, second_end) or
      is_contained_by?(second_start, second_end, first_start, first_end)
  end

  defp contains_other2?(tuple) do
    [first, second] = String.split(tuple, ",")
    [first_start, first_end] = String.split(first, "-") |> Enum.map(&parse_int!(&1))
    [second_start, second_end] = String.split(second, "-") |> Enum.map(&parse_int!(&1))

    is_solaped_by?(first_start, first_end, second_start, second_end) or
      is_solaped_by?(second_start, second_end, first_start, first_end)
  end

  def calculate(file_path) do
    file_path
    |> File.read!()
    |> String.split("\n")
    |> Enum.reject(&(&1 == ""))
    |> Enum.filter(&contains_other?(&1))
    |> Enum.count()
  end

  def calculate2(file_path) do
    file_path
    |> File.read!()
    |> String.split("\n")
    |> Enum.reject(&(&1 == ""))
    |> Enum.filter(&contains_other2?(&1))
    |> Enum.count()
  end
end
