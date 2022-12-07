defmodule AdventOfCode2022.TurningTrouble do
  @moduledoc """
  ocumentation for Turning Trouble, the problem of the 5th day.
  """

  @doc """
  return true if all elements are different between all each other
  """

  # second part but also generic
  defp are_all_diferent?(list) do
    (list
    |> Enum.frequencies()
    |> map_size()) == length(list)
  end

  defp get_signal_by_size(list, signal_size) do
    first_n_elements = Enum.take(list, signal_size)
    |> IO.inspect()
    case are_all_diferent?(first_n_elements) do
      true ->
        signal_size
      false ->
        1 + get_signal_by_size(Enum.drop(list, 1), signal_size)
  end

  end

  def calculate(input, size) do
    input
    |> String.graphemes()
    |> get_signal_by_size(size)
  end
end
