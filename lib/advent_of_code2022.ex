defmodule AdventOfCode2022 do
  @moduledoc """
  Documentation for `AdventOfCode2022`.
  """


  alias AdventOfCode2022.Calories

  def day_01 do
    %{
      part_01: Calories.get_top_elf_calories("lib/files/day_01/elves_calories.txt", 1),
      part_02: Calories.get_top_elf_calories("lib/files/day_01/elves_calories.txt", 3)
    }
  end
end
