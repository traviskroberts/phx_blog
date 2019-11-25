defmodule PhxBlog.Post do
  use Ecto.Schema
  import Ecto.Changeset

  alias PhxBlog.Comment

  schema "posts" do
    field :content, :string
    field :publish_date, :date
    field :title, :string
    has_many :comments, Comment

    timestamps()
  end

  @doc false
  def changeset(post, attrs) do
    post
    |> cast(attrs, [:title, :content, :publish_date])
    |> validate_required([:title, :content, :publish_date])
  end
end
