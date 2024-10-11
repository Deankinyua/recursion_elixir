defmodule Recursive.TodoList do
  alias Recursive.MultiDict
  # * in any complex system there will be need for higher level data abstractions
  # * in object oriented languages these abstractions are implemented via classes and objects
  # * In Elixir, such abstractions are implemented with pure, stateless modules

  def new, do: MultiDict.new()

  def add_entry(todo_list, date, title) do
    MultiDict.add(todo_list, date, title)
  end

  def entries(todo_list, date) do
    MultiDict.get(todo_list, date)
  end

  def today(todo_list) do
    {date, _time} = :calendar.local_time()

    MultiDict.get(todo_list, date)
  end
end
