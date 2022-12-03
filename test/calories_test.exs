defmodule AdventOfCode2022.CaloriesTest do
  use ExUnit.Case
  alias AdventOfCode2022.Calories
  doctest Calories

  test "count max calories with test file" do
    assert Calories.get_top_elf_calories("lib/files/day_01/elves_calories_test.txt", 1) == 24000
  end

  test "sum of top three max calories with test file" do
    assert Calories.get_top_elf_calories("lib/files/day_01/elves_calories_test.txt", 3) == 45000
  end


  test "count max calories with real data" do
    assert Calories.get_top_elf_calories("lib/files/day_01/elves_calories.txt", 1) == 72017
  end

  test "sum of top three max calories with real data" do
    assert Calories.get_top_elf_calories("lib/files/day_01/elves_calories.txt", 3) == 212520
  end

end
