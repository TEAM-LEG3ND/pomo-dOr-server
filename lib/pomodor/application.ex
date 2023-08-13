defmodule Pomodor.Application do
  # See https://hexdocs.pm/elixir/Application.html
  # for more information on OTP Applications
  @moduledoc false

  use Application

  @impl true
  def start(_type, _args) do
    children = [
      # Start the Telemetry supervisor
      PomodorWeb.Telemetry,
      # Start the Ecto repository
      Pomodor.Repo,
      # Start the PubSub system
      {Phoenix.PubSub, name: Pomodor.PubSub},
      # Start Finch
      {Finch, name: Pomodor.Finch},
      # Start the Endpoint (http/https)
      PomodorWeb.Endpoint
      # Start a worker by calling: Pomodor.Worker.start_link(arg)
      # {Pomodor.Worker, arg}
    ]

    # See https://hexdocs.pm/elixir/Supervisor.html
    # for other strategies and supported options
    opts = [strategy: :one_for_one, name: Pomodor.Supervisor]
    Supervisor.start_link(children, opts)
  end

  # Tell Phoenix to update the endpoint configuration
  # whenever the application is updated.
  @impl true
  def config_change(changed, _new, removed) do
    PomodorWeb.Endpoint.config_change(changed, removed)
    :ok
  end
end
