defmodule Recursive.TodoList do
  defstruct auto_id: 1, entries: Map.new()
  alias Recursive.TodoList
  # alias Recursive.MultiDict
  # * in any complex system there will be need for higher level data abstractions
  # * in object oriented languages these abstractions are implemented via classes and objects
  # * In Elixir, such abstractions are implemented with pure, stateless modules jin form of structs

  def new, do: %TodoList{}

  # * %TodoList{entries: entries, auto_id: auto_id} = todo_list
  # * requires that the todo_list be in the above form meaning has the entries and the auto_id value
  def add_entry(
        %TodoList{entries: entries, auto_id: auto_id} = todo_list,
        entry
      ) do
    entry = Map.put(entry, :id, auto_id)
    new_entries = Map.put(entries, auto_id, entry)
    %TodoList{todo_list | entries: new_entries, auto_id: auto_id + 1}
  end

  # * %TodoList{entries: entries}
  # * out of the todolist that is past only take the entries field and throw
  # * away the auto_id field

  def entries(%TodoList{entries: entries}, date) do
    entries
    |> Stream.filter(fn {_, entry} ->
      entry.date == date
    end)
    |> Enum.map(fn {_, entry} ->
      entry
    end)
  end

  # todo = TodoList.new() |>
  # TodoList.add_entry(%{date: {2013, 12, 19}, title: "Dentist"})

  # {date, _time} = :calendar.local_time()
end
