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
        {:value, caller} ->
          send(caller, {:response, current_value})
          current_value

        {:add, value} ->
          current_value + value

        {:sub, value} ->
          current_value - value

        {:mul, value} ->
          current_value * value

        {:div, value} ->
          current_value / value

        invalid_request ->
          IO.puts("invalid request #{inspect(invalid_request)}")
          current_value
      end

    loop(new_value)
  end

  # defp run_query(connection, query_def) do
  #   :timer.sleep(2000)
  #   "Connection #{connection}:  #{query_def} result"
  # end

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
