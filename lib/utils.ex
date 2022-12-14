defmodule AdventOfCode2022.Utils do
  def parse_int!(value) do
    case parse_int(value) do
      {:ok, value} -> value
      {:error, error} -> raise(error)
    end
  end

  def parse_int(value) do
    case Integer.parse(value) do
      {value, ""} -> {:ok, value}
      error -> {:error, error}
    end
  end
end