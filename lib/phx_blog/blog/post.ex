defmodule PhxBlog.Blog.Post do
  use Ecto.Schema
  import Ecto.Changeset

  alias PhxBlog.Blog.Comment

  schema "posts" do
    field :content, :string
    field :publish_date, :date
    field :title, :string
    has_many :comments, Comment

    timestamps()
  end

  def changeset(post, attrs) do
    post
    |> cast(attrs, [:title, :content, :publish_date])
    |> validate_required([:title, :content, :publish_date])
  end

  def slugify(post) do
    slug =
      post.title
      |> String.downcase()
      |> String.replace(~r/[^a-z0-9\s-]/, "")
      |> String.replace(~r/(\s|-)+/, "-")

    Date.to_iso8601(post.publish_date) <> "-" <> slug
  end
end
