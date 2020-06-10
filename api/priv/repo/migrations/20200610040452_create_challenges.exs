defmodule Captur.Repo.Migrations.CreateChallenges do
  use Ecto.Migration

  def change do
    create table(:challenges) do
      add :title, :string
      add :description, :text
      add :body, :text
      add :body_format, :string
      add :answer, :string
      add :explanation, :text
      add :explanation_format, :string
      add :points, :integer
      add :start_date, :naive_datetime
      add :end_date, :naive_datetime
      add :hidden, :boolean, default: false, null: false
      add :game_id, references(:games, on_delete: :nothing)

      timestamps()
    end

    create index(:challenges, [:game_id])
  end
end
