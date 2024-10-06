defmodule Recursive.Streams do
  # ? streams in Elixir are used to do lazy enumeration
  # ? the actual computation has not happened yet

  def stream_lazy do
    [9, -1, "foo", 25, 49]
    |> Stream.filter(&(is_number(&1) and &1 > 0))
    |> Stream.map(&{&1, :math.sqrt(&1)})
    |> Stream.with_index(1)
    |> Enum.each(fn {{input, result}, index} ->
      IO.puts("#{index}. sqrt(#{input}) = #{result}")
    end)
  end

  # In contrast, if you used Enum functions everywhere,
  # you would have to run multiple iterations over each intermediate list, which would
  # incur a performance and memory-usage penalty
end
