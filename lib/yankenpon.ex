defmodule AdventOfCode2022.Yankenpon do
  # A: Rock B: Paper, C: Scissors
  # X: Rock, Y: Paper, Z: Scissors

  # Points
  # 0 - lost
  # 3 - draw
  # 6 - win

  # Extra points
  # x:1 y:2 z:3
  @points_per_draw 3

  @doc """
  Returns 0 if lost, 1 when draw, 2 when wins, intput a is the oponent, input b us
  """
  def yankenpon(a, b) when a == b do
    1
  end

  def yankenpon(:paper, :rock) do
    0
  end

  def yankenpon(:rock, :scissors) do
    0
  end

  def yankenpon(:scissors, :paper) do
    0
  end

  def yankenpon(:scissors, :rock) do
    2
  end

  def yankenpon(:paper, :scissors) do
    2
  end

  def yankenpon(:rock, :paper) do
    2
  end

  def atomize_input(input) do
    normalized_input =
      input
      |> String.replace("X", "A")
      |> String.replace("Y", "B")
      |> String.replace("Z", "C")

    case normalized_input do
      "A" ->
        :rock

      "B" ->
        :paper

      "C" ->
        :scissors
    end
  end

  def choose_points(b) do
    case b do
      :rock ->
        1

      :paper ->
        2

      :scissors ->
        3
    end
  end

  def calculate_round_points(other, me) do
    a = atomize_input(other)
    b = atomize_input(me)
    round_result = yankenpon(a, b)
    choose_points = choose_points(b)
    round_result * @points_per_draw + choose_points
  end

  def execute_rounds([head | tail], result) do
    [a, b] = String.split(head, " ")
    round_points = calculate_round_points(a, b)
    execute_rounds(tail, result + round_points)
  end

  def execute_rounds([], result) do
    result
  end

  def calculate(input) do
    rounds =
      input
      |> String.split("\r\n")

    total_points = execute_rounds(rounds, 0)
    total_points
  end

  ## Second part

  # loose
  def get_input(other, "X") do
    case other do
      :rock ->
        :scissors

      :paper ->
        :rock

      :scissors ->
        :paper
    end
  end

  # draw
  def get_input(other, "Y") do
    other
  end

  # win
  def get_input(other, "Z") do
    case other do
      :rock ->
        :paper

      :paper ->
        :scissors

      :scissors ->
        :rock
    end
  end

  def calculate_round_points2(other, secret) do
    a = atomize_input(other)
    b = get_input(a, secret)
    round_result = yankenpon(a, b)
    choose_points = choose_points(b)
    round_result * @points_per_draw + choose_points
  end

  def execute_rounds2([head | tail], result) do
    [a, b] = String.split(head, " ")
    round_points = calculate_round_points2(a, b)
    execute_rounds2(tail, result + round_points)
  end

  def execute_rounds2([], result) do
    result
  end

  # X. loose, Y. Draw, Z. Win
  #
  def calculate2(input) do
    rounds =
      input
      |> String.split("\r\n")

    total_points = execute_rounds2(rounds, 0)
    total_points
  end
end
