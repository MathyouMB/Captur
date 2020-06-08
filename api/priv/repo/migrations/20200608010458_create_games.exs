defmodule Captur.Repo.Migrations.CreateGames do
  use Ecto.Migration

  def change do
    create table(:games) do
      add :title, :string
      add :description, :text
      add :start_date, :naive_datetime
      add :end_date, :naive_datetime
      add :hidden, :boolean, default: false, null: false
      add :user_id, references(:users, on_delete: :delete_all)

      timestamps()
    end

    create index(:games, [:user_id])
  end
end
