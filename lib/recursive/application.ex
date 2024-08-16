defmodule Recursive.Application do
  # See https://hexdocs.pm/elixir/Application.html
  # for more information on OTP Applications
  @moduledoc false

  use Application

  @impl true
  def start(_type, _args) do
    children = [
      RecursiveWeb.Telemetry,
      Recursive.Repo,
      {DNSCluster, query: Application.get_env(:recursive, :dns_cluster_query) || :ignore},
      {Phoenix.PubSub, name: Recursive.PubSub},
      # Start the Finch HTTP client for sending emails
      {Finch, name: Recursive.Finch},
      # Start a worker by calling: Recursive.Worker.start_link(arg)
      # {Recursive.Worker, arg},
      # Start to serve requests, typically the last entry
      RecursiveWeb.Endpoint
    ]

    # See https://hexdocs.pm/elixir/Supervisor.html
    # for other strategies and supported options
    opts = [strategy: :one_for_one, name: Recursive.Supervisor]
    Supervisor.start_link(children, opts)
  end

  # Tell Phoenix to update the endpoint configuration
  # whenever the application is updated.
  @impl true
  def config_change(changed, _new, removed) do
    RecursiveWeb.Endpoint.config_change(changed, removed)
    :ok
  end
end
