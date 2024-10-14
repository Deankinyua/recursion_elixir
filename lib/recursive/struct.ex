defmodule Recursive.Fraction do
  alias Recursive.Fraction
  # * a fraction has a well-defined structure, so you can use struct to specify
  # *  and enforce data correctness

  defstruct num: nil, den: nil

  def new(a, b) do
    %Fraction{num: a, den: b}
  end

  def value(%Fraction{num: a, den: b}) do
    a / b
  end

  def add(
        %Fraction{num: a1, den: b1},
        %Fraction{num: a2, den: b2}
      ) do
    new(
      a1 * b2 + a2 * b1,
      b2 * b1
    )
  end
end
