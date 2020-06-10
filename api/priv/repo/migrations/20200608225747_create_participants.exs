defmodule Captur.Repo.Migrations.CreateParticipants do
  use Ecto.Migration

  def change do
    create table(:participants) do
      add :user_id, references(:users, on_delete: :nothing)
      add :game_id, references(:games, on_delete: :nothing)
      timestamps()
    end

    create index(:participants, [:user_id])
    create index(:participants, [:game_id])

  end
end
