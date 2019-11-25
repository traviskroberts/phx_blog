defmodule PhxBlogWeb.CommentController do
  use PhxBlogWeb, :controller

  alias PhxBlog.Blog

  def create(conn, %{"comment" => comment_params}) do
    post = Blog.get_post!(comment_params["post_id"])

    Blog.add_comment(post, comment_params)

    conn
    |> put_flash(:info, "Comment added!")
    |> redirect(to: Routes.page_path(conn, :show, post.id, "post-title"))
  end
end
