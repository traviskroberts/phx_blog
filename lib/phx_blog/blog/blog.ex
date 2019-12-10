defmodule PhxBlog.Blog do
  import Ecto.Query, warn: false

  alias PhxBlog.Repo
  alias PhxBlog.Blog.Post

  def list_posts do
    Repo.all(from Post, order_by: [desc: :publish_date])
  end

  def get_post!(id) do
    Post
    |> Repo.get!(id)
    |> Repo.preload(:comments)
  end

  def create_post(attrs \\ %{}) do
    %Post{}
    |> Post.changeset(attrs)
    |> Repo.insert()
  end

  def update_post(%Post{} = post, attrs) do
    post
    |> Post.changeset(attrs)
    |> Repo.update()
  end

  def delete_post(%Post{} = post) do
    Repo.delete(post)
  end

  def change_post(%Post{} = post) do
    Post.changeset(post, %{})
  end

  def get_comments(post_id) do
    post = get_post!(post_id)
    {:ok, post.comments}
  end

  def add_comment(%Post{} = post, comment_attrs \\ %{}) do
    comment_changeset =
      Ecto.build_assoc(post, :comments,
        author: comment_attrs["author"],
        body: comment_attrs["body"]
      )

    Repo.insert(comment_changeset)
  end
end
