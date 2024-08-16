defmodule Recursive.Fibogpt do
  # * Naive solution of factorial

  # def factorial(1), do: 1
  # def factorial(n), do: n * factorial(n - 1)

  # * Tail recursive problem solution of factorial

  def factorial(n), do: factorial_trail(n, 1)

  def factorial_trail(1, acc), do: acc

  def factorial_trail(n, acc), do: factorial_trail(n - 1, n * acc)

  # * Converting to a tail recursive function
  # * Examine the naive version
  # * how many recursive calls are being made?

  # * The number of recursive calls will be equal to the number of variables being used
  # * in the tail recursive version

  # def fibonaci(n) do
  #   fibonaci(n - 1) + fibonaci(n - 2)
  # end

  def fib(n), do: fib(n, 0, 1)

  defp fib(1, _acc1, acc2), do: acc2
  defp fib(n, acc1, acc2), do: fib(n - 1, acc2, acc1 + acc2)

  # fib(3) => fib(3, 0, 1) => fib(2, 1, 1) => fib(1, 1, 2)

  # fib(5) => fib(5, 0, 1) => fib(4, 1, 1) => fib(3, 1, 2) => fib(2, 2, 3) => fib(1, 3, 5)
end
