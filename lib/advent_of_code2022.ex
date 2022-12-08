defmodule AdventOfCode2022 do
  @moduledoc """
  Documentation for `AdventOfCode2022`.
  """

  alias AdventOfCode2022.Calories
  alias AdventOfCode2022.Yankenpon
  alias AdventOfCode2022.Rucksack
  alias AdventOfCode2022.Pairs
  alias AdventOfCode2022.SupplyStacks
  alias AdventOfCode2022.TurningTrouble
  alias AdventOfCode2022.DeviceSpace

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

  def day_04 do
    %{
      part_01: Pairs.calculate("lib/files/day_04/pairs.txt"),
      part_02: Pairs.calculate2("lib/files/day_04/pairs.txt"),
      test: Pairs.calculate("lib/files/day_04/pairs_test.txt")
    }
  end

  def day_05 do
    %{
      part_01: SupplyStacks.calculate("lib/files/day_05/stacks.txt"),
      test: SupplyStacks.calculate("lib/files/day_05/stacks_test.txt")
    }
  end

  def day_06 do
    %{
      part_01: TurningTrouble.calculate(File.read!("lib/files/day_06/turning.txt"), 4),
      part_02: TurningTrouble.calculate(File.read!("lib/files/day_06/turning.txt"), 14)
    }
  end

  def day_07 do
    %{
      part_01: DeviceSpace.calculate("lib/files/day_07/terminal_output.txt", 100_000),
      test: DeviceSpace.calculate("lib/files/day_07/terminal_output_test.txt", 100_000)

    }
  end
end
