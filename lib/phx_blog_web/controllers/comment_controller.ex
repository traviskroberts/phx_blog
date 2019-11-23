defmodule PhxBlogWeb.CommentController do
  use PhxBlogWeb, :controller

  alias PhxBlog.Repo
  alias PhxBlog.Blog
  alias PhxBlog.Blog.{Comment, Post}

  def create(conn, %{"comment" => comment_params}) do
    post = Blog.get_post!(1)

    comment_changeset =
      Ecto.build_assoc(post, :comments,
        author: comment_params["author"],
        body: comment_params["body"]
      )

    Repo.insert(comment_changeset)

    conn
    |> put_flash(:info, "Comment added!")
    |> redirect(to: Routes.page_path(conn, :show, post.id, "post-title"))
  end
end
