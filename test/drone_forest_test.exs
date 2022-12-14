
defmodule AdventOfCode2022.DroneForestTest do
  use ExUnit.Case, async: true
  alias AdventOfCode2022.DroneForest

  @forest_file_path "lib/files/day_08/forest.txt"
  @test_file_path "lib/files/day_08/forest_test.txt"

  test "get trees viewed by drone with test input" do
    assert DroneForest.calculate(@test_file_path) == 21
  end

  test "get trees viewed by drone with puzzle input" do
    assert DroneForest.calculate(@forest_file_path) == 1803
  end

end