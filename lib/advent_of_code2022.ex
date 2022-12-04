defmodule AdventOfCode2022 do
  @moduledoc """
  Documentation for `AdventOfCode2022`.
  """


  alias AdventOfCode2022.Calories
  alias AdventOfCode2022.Yankenpon
  alias AdventOfCode2022.Rucksack

  def day_01 do
    %{
      part_01: Calories.get_top_elf_calories("lib/files/day_01/elves_calories.txt", 1),
      part_02: Calories.get_top_elf_calories("lib/files/day_01/elves_calories.txt", 3)
    }
  end

  def day_02 do
    %{
      part_01: Yankenpon.calculate(File.read!("lib/files/day_02/yankenpon.txt")),
      part_02: Yankenpon.calculate2(File.read!("lib/files/day_02/yankenpon.txt"))
    }
  end

  def day_03 do
    %{
      part_01: Rucksack.calculate("lib/files/day_03/rucksack.txt"),
      part_02: Rucksack.calculate2("lib/files/day_03/rucksack.txt")
    }
  end
end
