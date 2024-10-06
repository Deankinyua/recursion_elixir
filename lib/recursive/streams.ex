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

  def large_lines do
    path = Path.absname("mix.exs")

    File.stream!(path)
    |> Stream.map(&String.replace(&1, "\n", ""))
    |> Enum.filter(&(String.length(&1) > 80))
  end

  def lines_length do
    path = Path.absname("mix.exs")

    File.stream!(path)
    |> Stream.map(&String.replace(&1, "\n", ""))
    |> Stream.map(&String.length(&1))
    |> Enum.to_list()
  end

  def longest_line do
    path = Path.absname("mix.exs")

    file_list =
      File.stream!(path)
      |> Stream.map(&String.replace(&1, "\n", ""))

    max_length =
      file_list
      |> Stream.map(&String.length(&1))
      |> Enum.max()

    long_string =
      file_list
      |> Enum.filter(&(String.length(&1) == max_length))
      |> Enum.at(0)

    # max_length
    # Enum.to_list(file_list)
    long_string
  end

  def read_file do
    path = Path.absname("mix.exs")
    File.read!(path)
  end

  # In contrast, if you used Enum functions everywhere,
  # you would have to run multiple iterations over each intermediate list, which would
  # incur a performance and memory-usage penalty
end
