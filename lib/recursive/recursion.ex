defmodule Recursive.Recursion do
  def upto(0), do: :ok

  # * Tail Recursion Explained: ComputerPhile

  # note: A function is tail-recursive if the last thing executed by the function is a call to itself.
  # note: otherwise it is head-recursive
  def upto(num) do
    IO.puts("number #{num}")
    upto(num - 1)
  end

  # * This is very inefficient when the number is too large and uses a lot of memory. Try factorial(400000)
  # def factorial(n), do: n * factorial(n - 1)

  def factorial(n), do: factorial_trail(n, 1)

  def factorial_trail(1, acc), do: acc

  def factorial_trail(n, acc), do: factorial_trail(n - 1, n * acc)

  # 2 => factorial_trail(1, 2)
  # * 4 => factorial_trail(3, 4 * 1) => factorial_trail(3, 4) => factorial_trail(2, 12) => factorial_trail(1, 24) => 24

  # note: the Fibonacci sequence implemented inefficiently

  # def fibonaci(n) do
  #   fibonaci(n - 1) + fibonaci(n - 2)
  # end

  def fibonaci(0), do: 0

  # def fibonaci(1), do: 1

  def fibonaci(n), do: fibonaci_tail(n, 1)

  def fibonaci_tail(1, acc), do: acc

  def fibonaci_tail(n, acc), do: fibonaci_tail(n - 1, n - 1 + acc)

  # fibonaci_tail(2, 1) => fibonaci_tail(1, 1 + 0)

  # fibonaci_tail(4, 1) => fibonaci_tail(3, 3) => fibonaci_tail(2, 4) => fibonaci_tail(1, 4 + 0)

  # Count the length of a list without an accumulator
  # def count([]), do: 0
  # def count([_head | tail]), do: 1 + count(tail)

  # Count the length of a list with an accumulator
  def count(list), do: do_count(list, 0)

  defp do_count([], count), do: count
  defp do_count([_head | tail], count), do: do_count(tail, count + 1)

  # do_count([1, 2, 3], 0) => do_count([2, 3], 1) => do_count([3], 2) => do_count([], 3)

  # Reverse a list with an accumulator
  def reverse(list), do: do_reverse(list, [])

  defp do_reverse([], acc), do: acc

  defp do_reverse([head | tail], acc) do
    do_reverse(tail, [head | acc])
  end

  # do_reverse([1, 2, 3], []) => do_reverse([2, 3], [1 | []]) => do_reverse([2, 3], [1])
  # do_reverse([3], [2 | [1]]) => do_reverse([3], [2, 1]) => do_reverse([], [3 | [2, 1]])
  #  => [3, 2, 1]

  # * In case of tail-recursive methods, there is no need to reserve
  # * a place in the stack for the recursive call because there is nothing left
  # * to do in the current method and we won't be returning to the parent call
end
