defmodule PhxBlog.Comment do
  use Ecto.Schema
  import Ecto.Changeset

  alias PhxBlog.Post

  schema "comments" do
    field :author, :string
    field :body, :string
    belongs_to :post, Post

    timestamps()
  end

  @doc false
  def changeset(comment, attrs \\ %{}) do
    comment
    |> cast(attrs, [:author, :body, :post_id])
    |> validate_required([:author, :body, :post_id])
  end
end
