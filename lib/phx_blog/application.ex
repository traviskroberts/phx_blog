defmodule PhxBlog.Application do
  use Application

  def start(_type, _args) do
    # List all child processes to be supervised
    children = [
      # Start the Ecto repository
      PhxBlog.Repo,
      # Start the PubSub system
      {Phoenix.PubSub, name: PhxBlog.PubSub},
      # Start the endpoint when the application starts
      PhxBlogWeb.Endpoint
      # Starts a worker by calling: PhxBlog.Worker.start_link(arg)
      # {PhxBlog.Worker, arg},
    ]

    # See https://hexdocs.pm/elixir/Supervisor.html
    # for other strategies and supported options
    opts = [strategy: :one_for_one, name: PhxBlog.Supervisor]
    Supervisor.start_link(children, opts)
  end

  # Tell Phoenix to update the endpoint configuration
  # whenever the application is updated.
  def config_change(changed, _new, removed) do
    PhxBlogWeb.Endpoint.config_change(changed, removed)
    :ok
  end
end
