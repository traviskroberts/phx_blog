defmodule PhxBlogWeb.Router do
  use PhxBlogWeb, :router
  use Pow.Phoenix.Router
  import Phoenix.LiveDashboard.Router

  pipeline :browser do
    plug :accepts, ["html"]
    plug :fetch_session
    plug :fetch_flash
    plug :fetch_live_flash
    plug :protect_from_forgery
    plug :put_secure_browser_headers
  end

  pipeline :api do
    plug :accepts, ["json"]
  end

  pipeline :protected do
    plug Pow.Plug.RequireAuthenticated,
      error_handler: Pow.Phoenix.PlugErrorHandler
  end

  scope "/" do
    pipe_through :browser

    pow_routes()
  end

  # public routes
  scope "/", PhxBlogWeb do
    pipe_through :browser

    get "/", PageController, :index
    get "/blog/:id/:title", PageController, :show
    resources "/comments", CommentController, only: [:create]
  end

  # protected routes
  scope "/", PhxBlogWeb do
    pipe_through [:browser, :protected]

    resources "/posts", PostController
  end

  # LiveDashboard
  if Mix.env() == :dev do
    scope "/" do
      pipe_through :browser
      live_dashboard "/dashboard"
    end
  end
end
