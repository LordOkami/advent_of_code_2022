defmodule AdventOfCode2022.DeviceSpaceTest do
  use ExUnit.Case
  alias AdventOfCode2022.DeviceSpace
  doctest DeviceSpace

  test "sum of all dirs with less than 100_000 space" do
    assert DeviceSpace.calculate("lib/files/day_07/terminal_output_test.txt", 100_000) == 95437
  end


end
