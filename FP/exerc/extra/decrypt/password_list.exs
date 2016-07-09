defmodule PasswordList do
  def start do
    {:ok, pid} = Agent.start_link fn -> {} end
    PasswordList.load_list(pid)
    :yes = :global.register_name(:pass_list, pid)
    pid
  end

  def load_list(pid) do
    {:ok, passwords} = File.read("list_to_try.txt")
    passwords |> String.split("\n") |> Enum.each fn(x) ->
      Agent.update(pid, &(&1 ++ [x]))
    end
  end

  def get_next(pid, position) do
    Agent.get(pid, &(elem(&1, position)))
  end

end
