defmodule Server do
  require PasswordBucket
  def start do
    password_bucket_pid = PasswordBucket.start
    spawn(__MODULE__, :loop, [password_bucket_pid, 0])
  end

  def loop(pid, current_password_position) do
    receive do
      {:request, worker_pid} ->
        next_password = PasswordBucket.get_next(pid, current_password_position)
        send(worker_pid, {:response, next_password})
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
