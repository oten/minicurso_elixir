defmodule PasswordBucket do
  def start do
    {:ok, pid} = Agent.start_link fn -> {} end
    PasswordBucket.load_passwords(pid)
    :yes = :global.register_name(:pass_bucket, pid)
    pid
  end

  def load_passwords(pid) do
    {:ok, passwords} = File.read("passwords.txt")
    passwords |> String.split("\n") |> Enum.each fn(x) ->
      Agent.update(pid, &Tuple.append(&1, {x, false}))
    end
  end

  def get_next(pid, position) do
    Agent.get(pid, &(elem(&1, position)))
  end

  def mark_checked(pid, position) do
    Agent.update(pid, fn(x) ->
      {password, _} = elem(x, position)
      Tuple.delete_at(x, position)
      |> Tuple.insert_at(position, {password, true})
    end)
  end

  def count(pid) do
    Agent.get(pid, &(&1))
    |> Tuple.to_list
    |> Enum.filter(fn x -> elem(x, 1) == true end)
    |> Enum.count
  end
end

