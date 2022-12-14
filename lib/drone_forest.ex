defmodule AdventOfCode2022.DroneForest do
  @doc """
  Calculate the number of trees viewed by the drone in given line of vision"
  """
  import AdventOfCode2022.Utils, only: [parse_int!: 1]

  def calculate(file_path) do
    forest =
      file_path
      |> File.read!()
      |> String.split("\n")
      |> Enum.reject(&(&1 == ""))
      |> Enum.map(&String.graphemes(&1))
      |> Enum.map(&Enum.map(&1, fn v -> parse_int!(v) end))

    Enum.reduce(0..(length(forest) - 1), 0, fn y, trees ->
      x_range = 0..(length(Enum.at(forest, y)) - 1)

      trees +
        Enum.reduce(x_range, 0, fn x, x_trees ->
          if is_visible(forest, x, y) do
            x_trees + 1
          else
            x_trees
          end
        end)
    end)
  end

  defp is_visible(_forest, x, y) when x == 0 or y == 0, do: true
  defp is_visible(forest, _x, y) when y == length(forest) - 1, do: true

  defp is_visible(forest, x, y) do
    if x == length(Enum.at(forest, y)) - 1 do
      true
    else
      is_visible_row_column(forest, x, y)
    end
  end

  defp is_visible_row_column(forest, x, y) do
    row = get_row(forest, x, y)
    column = get_column(forest, x, y)
    is_visible_in_row(row, x) or is_visible_in_row(column, y)
  end

  defp get_row(forest, _x, y) do
    Enum.at(forest, y)
  end

  defp get_column(forest, x, _y) do
    Enum.reduce(forest, [], fn row, column ->
      column ++ [Enum.at(row, x)]
    end)
  end

  defp is_visible_in_row(row, position) do
    {left, _} = Enum.split(row, position)
    {_, right} = Enum.split(row, position + 1)
    value = Enum.at(row, position)
    Enum.all?(left, &(&1 < value)) or Enum.all?(right, &(&1 < value))
  end

  
end
