defmodule AdventOfCode2022.DeviceSpaceTest do
  use ExUnit.Case, async: true
  alias AdventOfCode2022.DeviceSpace

  @commands_file_path "lib/files/day_07/terminal_output.txt"
  @min_folder_size 100_000
  @free_space 30_000_000
  @total_space 70_000_000

  test "get total folders size" do
    size =
      @commands_file_path
      |> DeviceSpace.calculate(@min_folder_size)

    assert size == 919137
  end

  test "get size to remove to get enought space to update" do
    size =
      @commands_file_path
      |> DeviceSpace.calculate2(@total_space, @free_space)

    assert size == 2877389
  end
end