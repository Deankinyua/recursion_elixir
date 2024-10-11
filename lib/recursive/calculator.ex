defmodule Recursive.Calculator do
  def start do
    spawn(fn ->
      current_value = 0

      loop(current_value)
    end)
  end

  defp loop(current_value) do
    new_value =
      receive do
        message -> process_message(current_value, message)
      end

    loop(new_value)
  end

  defp process_message(current_value, {:value, caller}) do
    send(caller, {:response, current_value})
    current_value
  end

  defp process_message(current_value, {:add, value}) do
    current_value + value
  end

  defp process_message(current_value, {:sub, value}) do
    current_value - value
  end

  defp process_message(current_value, {:mul, value}) do
    current_value * value
  end

  defp process_message(current_value, {:div, value}) do
    current_value / value
  end

  def value(pid) do
    send(pid, {:value, self()})
    get_result()
  end

  def add(pid, num) do
    send(pid, {:add, num})
  end

  def sub(pid, num) do
    send(pid, {:sub, num})
  end

  def mul(pid, num) do
    send(pid, {:mul, num})
  end

  def div(pid, num) do
    send(pid, {:div, num})
  end

  def get_result do
    receive do
      {:response, result} -> result
    after
      5000 ->
        {:error, :timeout}
    end
  end
end
