defmodule AdventOfCode2022.PairsTest do
  use ExUnit.Case
  alias AdventOfCode2022.Pairs
  doctest Pairs

  test "count pairs with test file" do
    assert Pairs.calculate("lib/files/day_04/pairs_test.txt") == 2
  end


end
