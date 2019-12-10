defmodule PhxBlogWeb.PageView do
  use PhxBlogWeb, :view

  alias PhxBlog.Blog.Post

  def as_html(txt) do
    txt
    |> Earmark.as_html!()
    |> raw()
  end

  def post_slug(post) do
    Post.slugify(post)
  end
end
