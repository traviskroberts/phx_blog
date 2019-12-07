defmodule PhxBlogWeb.CommentsLive do
  use Phoenix.LiveView

  alias PhxBlog.Blog

  def mount(%{post_id: post_id} = _session, socket) do
    post = Blog.get_post!(post_id)
    {:ok, assign(socket, post: post)}
  end

  def render(assigns) do
    ~L"""
    <h2>Comments</h2>
    <%= for comment <- @post.comments do %>
      <p>
        <strong><%= comment.author %></strong>
      </p>
      <p><%= comment.body %></p>
    <% end %>
    """
  end
end
