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

  def naive_exp(_x, 0), do: 1

  def naive_exp(x, n) do
    x * naive_exp(x, n - 1)
  end

  # exp(3, 3) => 3 * exp(3, 2) => 3 * 3 * exp(3, 1) => 3 * 3 * 3  * exp(3, 0)
  # answer = x ^ n

  # note: The tail recursive exponential function

  def exp(_x, 0), do: 1
  def exp(x, n), do: exp_tail(x, n, 1)

  def exp_tail(_x, 0, acc), do: acc

  def exp_tail(x, n, acc) do
    exp_tail(x, n - 1, acc * x)
  end

  # exp(3, 3) => exp_tail(3, 3, 1) => exp_tail(3, 2, 3) => exp_tail(3, 1, 9) => exp_tail(3, 0, 27)

  def fib(n), do: fib(n, 0, 1)

  defp fib(1, _acc1, acc2), do: acc2
  defp fib(n, acc1, acc2), do: fib(n - 1, acc2, acc1 + acc2)

  # Write a tail recursive function that computes the sum of a list of integers.

  def naive_sum([]), do: 0

  def naive_sum([head | tail]) do
    head + naive_sum(tail)
  end

  def list_sum([]), do: 0

  def list_sum([head | tail]) do
    list_sum([head | tail], 0)
  end

  def list_sum([], acc), do: acc

  def list_sum([head | tail], acc) do
    list_sum(tail, acc + head)
  end

  # note: finding the smallest element in a list

  def naive_smallet([]), do: nil

  def naive_smallet([head | tail]) do
    naive_smallet([head | tail], 0)
  end

  def naive_smallet([], acc), do: acc

  def naive_smallet([head | tail], acc) do
    if(acc >= head) do
      naive_smallet(tail, acc)
    else
      naive_smallet(tail, head)
    end
  end

  # fib(3) => fib(3, 0, 1) => fib(2, 1, 1) => fib(1, 1, 2)

  # fib(5) => fib(5, 0, 1) => fib(4, 1, 1) => fib(3, 1, 2) => fib(2, 2, 3) => fib(1, 3, 5)
end
