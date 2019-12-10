defmodule PhxBlog.Blog.Comment do
  use Ecto.Schema
  import Ecto.Changeset

  alias PhxBlog.Blog.Post

  schema "comments" do
    field :author, :string
    field :body, :string
    belongs_to :post, Post

    timestamps()
  end

  def changeset(comment, attrs \\ %{}) do
    comment
    |> cast(attrs, [:author, :body, :post_id])
    |> validate_required([:author, :body, :post_id])
  end
end
