defmodule AdventOfCode2022.DeviceSpace do
  @moduledoc """
  Documentation for DeviceSpace.
  """
  def calculate(input, dir_size) do
    input
    |> File.read!()
    |> String.split("$ ")
    |> Enum.drop(1)
    |> Enum.map(&(String.split(&1, "\n") |> Enum.filter(fn x -> x != "" end)))
    |> IO.inspect()
    |> execute_commands([], %{})
    |> Enum.filter(fn {_, value} -> value < dir_size end)
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
        # if key is in breadcrumbs, then it's a parent dir
        if Enum.member?(breadcrumbs, key) do
          {key, value + total_size}
        else
          {key, value}
        end
      end)
      |> Map.new()

    IO.inspect(dir_sizes_map)

    execute_commands(rest, breadcrumbs, dir_sizes_map)
  end

  # cd
  def execute_commands([["cd " <> directory | params] | rest], breadcrumbs, dir_sizes_map) do

    case directory do
      ".." ->
        breadcrumbs = breadcrumbs |> Enum.drop(-1)
        IO.inspect(breadcrumbs)
        execute_commands(rest, breadcrumbs, dir_sizes_map)

      directory_name ->
        # add the directory to the breadcrumbs
        breadcrumbs = breadcrumbs ++ [directory_name]
        IO.inspect(breadcrumbs)
        # if the directory is not in the map, then it's a new directory
        case !Map.has_key?(dir_sizes_map, directory_name) do
          true ->
            dir_sizes_map = Map.put(dir_sizes_map, directory_name, 0)
            execute_commands(rest, breadcrumbs, dir_sizes_map)

          _ ->
            execute_commands(rest, breadcrumbs, dir_sizes_map)
        end
    end
  end


end
