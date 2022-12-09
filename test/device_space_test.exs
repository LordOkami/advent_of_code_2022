defmodule AdventOfCode2022.DeviceSpaceTest do
  use ExUnit.Case
  alias AdventOfCode2022.DeviceSpace
  doctest DeviceSpace

  test "kerlak" do
    assert(
      DeviceSpace.calculate("lib/files/day_07/terminal_output_kerlak.txt", 100_000) == 1_581_595
    )
  end

  test "lordokami" do
    assert(
      DeviceSpace.calculate("lib/files/day_07/terminal_output.txt", 100_000) == 0
    )
  end

  test "lordokami 2" do
    assert(
      DeviceSpace.calculate2("lib/files/day_07/terminal_output.txt", 70_000_000, 30_000_000) == 0
    )
  end

end
