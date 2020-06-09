defmodule Captur.Games.Participant do
  use Ecto.Schema
  import Ecto.Changeset

  #@primary_key {:id, :binary_id, autogenerate: true}
  #@foreign_key_type :binary_id
  schema "participants" do
    belongs_to :game, Captur.Games.Game
    belongs_to :user, Captur.Games.User
    timestamps()
  end

  @doc false
  def changeset(participant, attrs) do
    participant
    |> cast(attrs, [])
    |> validate_required([])
  end
end
