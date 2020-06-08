defmodule Captur.Repo.Migrations.CreateGames do
  use Ecto.Migration

  def change do
    create table(:games, primary_key: false) do
      add :id, :binary_id, primary_key: true
      add :title, :string
      add :description, :text
      add :start_date, :naive_datetime
      add :end_date, :naive_datetime
      add :hidden, :boolean, default: false, null: false
      add :user_id, references(:users, on_delete: :delete_all, type: :binary_id)

      timestamps()
    end

    create index(:games, [:user_id])
  end
end
