defmodule Captur.Repo.Migrations.CreateRewards do
  use Ecto.Migration

  def change do
    create table(:rewards) do
      add :bonus_points, :integer
      add :participant_id, references(:participants, on_delete: :nothing)
      add :challenge_id, references(:challenges, on_delete: :nothing)

      timestamps()
    end

    create index(:rewards, [:participant_id])
    create index(:rewards, [:challenge_id])

  end
end
