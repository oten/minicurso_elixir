defmodule Server do

  def start do
    password_bucket_pid = PasswordBucket.start
    pid = spawn(__MODULE__, :loop, [password_bucket_pid, 0])
  end

  def loop(pid, current_password_position) do
    receive do
      {:request, worker_pid} ->
        PasswordBucket.get_next(pid, current_password_position)
        loop(pid, current_password_position+1)
      {:found, password, position} ->
        PasswordBucket.mark_as_checked(pid, position)
        IO.inspect "#{PasswordBucket.count(pid)} founded"
        loop(pid, current_password_position)
      5000 ->
        loop(pid, current_password_position)
    end
  end
end
