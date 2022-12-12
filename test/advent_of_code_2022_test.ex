defmodule AdventOfCode2022Test do
  use ExUnit.Case, async: true
  alias AdventOfCode2022

  @day01 %{part_01: 72_017, part_02: 212_520}
  @day02 %{part_01: 14_297, part_02: 10_498}
  @day03 %{part_01: 8_153, part_02: 2_342}
  @day04 %{part_01: 509, part_02: 870}
  @day05 %{part_01: "MQSHJMWNH"}
  @day06 %{part_01: 1_175, part_02: 3_217}
  @day07 %{part_01: 1_581_595, part_02: 1_544_176}

  test "match_snapshots" do
    assert AdventOfCode2022.day_01() == @day01
    assert AdventOfCode2022.day_02() == @day02
    assert AdventOfCode2022.day_03() == @day03
    assert AdventOfCode2022.day_04() == @day04
    assert AdventOfCode2022.day_05() == @day05
    assert AdventOfCode2022.day_06() == @day06
    assert AdventOfCode2022.day_07() == @day07
  end
end