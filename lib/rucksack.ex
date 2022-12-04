defmodule AdventOfCode2022.Rucksack do
  # A: 65, Z: 90 -> 27 - 52
  # a: 97, z: 122 -> 1 - 26

  @doc """
  Get the common element of two strings
  """

  # Part 1
  def get_rucksack_items([], result) do
    result
  end

  def get_rucksack_items([head | tail], result) do
    length = trunc(String.length(head) / 2)
    <<first::binary-size(length)>> <> second = head
    element = get_common_element(first, second)
    result = result ++ [element]
    get_rucksack_items(tail, result)
  end

  def calculate(input_file_path) do
    input =
      File.read!(input_file_path)
      |> String.split("\n")
      |> get_rucksack_items([])
      |> Enum.map(&get_priority(&1))
      |> Enum.sum()
  end

  # Common
  def get_common_element(string_a, string_b) do
    string_a
    |> String.graphemes()
    |> Enum.filter(fn char -> String.contains?(string_b, char) end)
    |> Enum.join()
  end

  def get_priority(element) do
    <<value::utf8>> = String.at(element, 0)

    cond do
      value >= 65 && value <= 90 ->
        value - 38

      value >= 97 && value <= 122 ->
        value - 96
    end
  end

  # 2nd part
  def get_rucksack_chunks([]), do: []

  def get_rucksack_chunks([[first, second, third] | tail]) do
    (first
     |> get_common_element(second)
     |> get_common_element(third)
     |> List.wrap()) ++
      get_rucksack_chunks(tail)
  end

  def calculate2(input_file_path) do
    input =
      File.read!(input_file_path)
      |> String.split("\n")
      |> Enum.reject(&(&1 == ""))
      |> Enum.chunk_every(3)
      |> get_rucksack_chunks()
      |> Enum.map(&get_priority(&1))
      |> Enum.sum()
  end
end
