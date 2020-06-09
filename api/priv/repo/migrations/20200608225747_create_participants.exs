defmodule Captur.Repo.Migrations.CreateParticipants do
  use Ecto.Migration

  def change do
    create table(:participants) do
      add :user_id, references(:users, on_delete: :delete_all)
      add :game_id, references(:games, on_delete: :delete_all)
      timestamps()
    end

  end
end
