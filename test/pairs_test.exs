
defmodule AdventOfCode2022.CleanupTest do
  use ExUnit.Case, async: true
  alias AdventOfCode2022.Pairs

  test "get fully recleanings" do
    assert Pairs.calculate("lib/files/day_04/pairs.txt") == 509
  end

  test "get overlap recleanings" do
    assert Pairs.calculate2("lib/files/day_04/pairs.txt") == 870
  end
end