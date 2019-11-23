defmodule PhxBlog.Repo.Migrations.CreateComments do
  use Ecto.Migration

  def change do
    create table(:comments) do
      add :author, :string
      add :body, :text
      add :post_id, references(:posts, on_delete: :delete_all)

      timestamps()
    end
  end
end
