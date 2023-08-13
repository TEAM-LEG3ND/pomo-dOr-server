defmodule Pomodor.Repo do
  use Ecto.Repo,
    otp_app: :pomodor,
    adapter: Ecto.Adapters.Postgres
end
