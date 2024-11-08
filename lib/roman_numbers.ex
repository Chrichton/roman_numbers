defmodule RomanNumbers do
  @moduledoc """
  Converts a roman number to an integer
  """

  @doc """
  to_number/1 converts a roman number to an integer.

  ## Examples

      iex> RomanNumbers.to_number("X")
      10

      iex> RomanNumbers.to_number("IX")
      9

  """
  def hello do
    :world
  end

  @conversion_table %{
    "I" => 1,
    "V" => 5,
    "X" => 10,
    "L" => 50,
    "C" => 100,
    "D" => 500,
    "M" => 1000
  }

  @substitution_table %{
    "IV" => "IIII",
    "IX" => "VIIII",
    "XL" => "XXXX",
    "XC" => "LXXXX",
    "CD" => "CCCC",
    "CM" => "DCCCC"
  }

  def roman_number?(""), do: false

  def roman_number?(roman_str) do
    roman_str
    |> String.graphemes()
    |> Enum.all?(fn x -> Map.has_key?(@conversion_table, x) end)
  end

  def to_number(roman_str) do
    roman_str
    |> substitute()
    |> convert()
  end

  def substitute(roman_str) do
    @substitution_table
    |> Enum.reduce(roman_str, fn {key, value}, acc ->
      String.replace(acc, key, value)
    end)
  end

  def convert(roman_str) do
    roman_str
    |> String.graphemes()
    |> Enum.reduce(0, fn x, acc -> @conversion_table[x] + acc end)
  end
end
