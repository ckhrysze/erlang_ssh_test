defmodule Mix.Tasks.Ssh do
  def run([ip, user, file]) do
    Application.ensure_all_started(:connector)
    IO.puts("Attempting to connect...")
    {:ok, conn} = SSH.connect(ip, user: user, identity: file, silently_accept_hosts: true)
    {:ok, path, _} = SSH.run(conn, "pwd")
    IO.puts("Connected, pwd returned: #{path}")
    SSH.close(conn)
  end

  def run(_) do
    IO.puts("Please enter IP username and key file name")
  end
end
