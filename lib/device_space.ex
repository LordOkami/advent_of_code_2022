defmodule AdventOfCode2022.DeviceSpace do
  @moduledoc """
  Documentation for DeviceSpace.
  """
  def calculate(input, dir_size) do
    input
    |> String.split("$ ")
    |> Enum.drop(1)
    |> Enum.map(&(String.split(&1, "\n") |> Enum.filter(fn x -> x != "" end)))
    |> execute_commands([], %{})
    |> Enum.filter(fn {_, value} -> value > dir_size end)
    |> IO.inspect()
    |> Enum.map(fn {key, value} -> value end)
    |> Enum.sum()
  end


  def execute_commands([], breadcrumbs, dir_sizes_map), do: dir_sizes_map

  # Utils
  def is_file?(input) do
    "dir" != input
  end

  defp parse_int!(value) do
    case Integer.parse(value) do
      {value, ""} -> value
      error -> raise(error)
    end
  end

  # ls
  def execute_commands([["ls" | params] | rest], breadcrumbs, dir_sizes_map) do
    total_size =
      params
      |> Enum.map(
        &(String.split(&1, " ")
          |> List.first())
      )
      |> Enum.filter(&is_file?(&1))
      |> Enum.map(&parse_int!(&1))
      |> Enum.sum()

    # increment all the dir_sizes_map with the total_size
    dir_sizes_map =
      dir_sizes_map
      |> Enum.map(fn {key, value} ->
        {key, value + total_size}
      end)
      |> Map.new()

    execute_commands(rest, breadcrumbs, dir_sizes_map)
  end

  # cd
  def execute_commands([["cd " <> directory | params] | rest], breadcrumbs, dir_sizes_map) do
    dir_sizes_map =
      dir_sizes_map
      # vamos a suponer que no entra dos veces en el mismo directorio. sino habría que cambiar esta línea
      |> Map.put(directory, 0)

    case directory do
      ".." ->
        execute_commands(rest, breadcrumbs |> Enum.drop(-1), dir_sizes_map)

      directory_name ->
        execute_commands(rest, breadcrumbs ++ [directory_name], dir_sizes_map)
    end
  end

  # else
  def execute_commands([_ | rest], breadcrumbs, dir_sizes_map) do
    IO.puts("NOT IMPLEMENTED YET")
    execute_commands(rest, breadcrumbs, dir_sizes_map)
  end
end
