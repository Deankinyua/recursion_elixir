defmodule Recursive.Process do
  def run_query(query_def) do
    run_query = fn query_def ->
      :timer.sleep(2000)
      "#{query_def} result"
    end

    run_query.(query_def)
  end

  def asyc_work do
    async_query = fn query_def ->
      spawn(fn ->
        IO.puts(run_query(query_def))
      end)
    end

    # async_query.("query 1")
    Enum.each(1..5, &async_query.("query #{&1}"))
  end

  # * Keep in mind that the result of self/0 depends on the calling process. If you didn’t
  # *store the result to the caller variable, and you tried to send(self, ...) from the
  # *inner lambda, it would have no effect. The spawned process would send the message to
  # *itself, because calling self from within a process returns the pid of that process.

  def send_async do
    async_query = fn query_def ->
      caller = self()

      spawn(fn ->
        send(caller, {:query_result, run_query(query_def)})
      end)
    end
  end
end
