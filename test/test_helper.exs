ExUnit.start

Mix.Task.run "ecto.create", ~w(-r HofiPhoenix.Repo --quiet)
Mix.Task.run "ecto.migrate", ~w(-r HofiPhoenix.Repo --quiet)
Ecto.Adapters.SQL.begin_test_transaction(HofiPhoenix.Repo)

