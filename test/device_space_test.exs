defmodule AdventOfCode2022.DeviceSpaceTest do
  use ExUnit.Case
  alias AdventOfCode2022.DeviceSpace
  doctest DeviceSpace
  # Juan Carlos Pazos Mandia, [09/12/2022 3:47]
  # $30 -> 66467

  # $ 40 - > 66467
  # $ 50 -> 164791

  test "kerlak" do
    assert(
      DeviceSpace.calculate("lib/files/day_07/terminal_output_kerlak.txt", 100_000) == 1_581_595
    )
  end

  test "test" do
    assert DeviceSpace.calculate("lib/files/day_07/terminal_output_test.txt", 500_000_000) ==
             73_410_244
  end

  test "test 2" do
    assert DeviceSpace.calculate("lib/files/day_07/terminal_output_test.txt", 2_000) == 584
  end
end
