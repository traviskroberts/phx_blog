defmodule PhxBlog.Repo.Migrations.CreatePosts do
  use Ecto.Migration

  def change do
    create table(:posts) do
      add :title, :string
      add :content, :text
      add :publish_date, :date

      timestamps()
    end

  end
end
