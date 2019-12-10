defmodule PhxBlogWeb do
  def controller do
    quote do
      use Phoenix.Controller, namespace: PhxBlogWeb

      import Plug.Conn
      import PhxBlogWeb.Gettext
      import Phoenix.LiveView.Controller

      alias PhxBlogWeb.Router.Helpers, as: Routes
    end
  end

  def view do
    quote do
      use Phoenix.View,
        root: "lib/phx_blog_web/templates",
        namespace: PhxBlogWeb

      # Import convenience functions from controllers
      import Phoenix.Controller, only: [get_flash: 1, get_flash: 2, view_module: 1]

      import Phoenix.LiveView, only: [live_render: 2, live_render: 3]

      # Use all HTML functionality (forms, tags, etc)
      use Phoenix.HTML

      import PhxBlogWeb.ErrorHelpers
      import PhxBlogWeb.Gettext
      alias PhxBlogWeb.Router.Helpers, as: Routes
    end
  end

  def router do
    quote do
      use Phoenix.Router
      import Plug.Conn
      import Phoenix.Controller
      import Phoenix.LiveView.Router
    end
  end

  def channel do
    quote do
      use Phoenix.Channel
      import PhxBlogWeb.Gettext
    end
  end

  defmacro __using__(which) when is_atom(which) do
    apply(__MODULE__, which, [])
  end
end
