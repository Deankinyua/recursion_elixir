defmodule Recursive.Recursion do
  def upto(0), do: :ok
  # note: A function is tail-recursive if the last thing executed by the function is a call to itself.
  def upto(num) do
    IO.puts("number #{num}")
    upto(num - 1)
  end
end
