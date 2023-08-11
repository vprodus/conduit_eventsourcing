defmodule ConduitBackend.Application do
  # See https://hexdocs.pm/elixir/Application.html
  # for more information on OTP Applications
  @moduledoc false

  use Application

  @impl true
  def start(_type, _args) do
    children = [
      ConduitBackend.App,
      # Start the Telemetry supervisor
      ConduitBackendWeb.Telemetry,
      # Start the Ecto repository
      ConduitBackend.Repo,
      # Start the PubSub system
      {Phoenix.PubSub, name: ConduitBackend.PubSub},
      # Start the Endpoint (http/https)
      ConduitBackendWeb.Endpoint
      # Start a worker by calling: ConduitBackend.Worker.start_link(arg)
      # {ConduitBackend.Worker, arg}
    ]

    # See https://hexdocs.pm/elixir/Supervisor.html
    # for other strategies and supported options
    opts = [strategy: :one_for_one, name: ConduitBackend.Supervisor]
    Supervisor.start_link(children, opts)
  end

  # Tell Phoenix to update the endpoint configuration
  # whenever the application is updated.
  @impl true
  def config_change(changed, _new, removed) do
    ConduitBackendWeb.Endpoint.config_change(changed, removed)
    :ok
  end
end
