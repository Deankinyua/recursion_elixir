defmodule Recursive.Server do
  # * we are talking about server processes which run forever

  # * start/0 is the so-called interface function that is used
  # * by clients to start the server   process. When start/0 is called,
  # *  it creates the long-running process that runs forever.

  def start do
    spawn(&loop/0)
  end

  defp loop do
    receive do
      {:run_query, caller, query_def} ->
        send(caller, {:query_result, run_query(query_def)})
    end

    loop()
  end

  defp run_query(query_def) do
    :timer.sleep(2000)
    "#{query_def} result"
  end
end
