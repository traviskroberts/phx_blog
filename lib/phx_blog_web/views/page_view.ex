defmodule PhxBlogWeb.PageView do
  use PhxBlogWeb, :view

  def as_html(txt) do
    txt
    |> Earmark.as_html!()
    |> raw()
  end

  def post_slug(post) do
    Date.to_iso8601(post.publish_date) <> "-" <> slugified_string(post.title)
  end

  def slugified_string(str) do
    str
    |> String.downcase()
    |> String.replace(~r/[^a-z0-9\s-]/, "")
    |> String.replace(~r/(\s|-)+/, "-")
  end
end
