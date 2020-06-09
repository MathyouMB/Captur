defmodule Captur.Games.User do
  use Ecto.Schema
  import Ecto.Changeset

  #@primary_key {:id, :binary_id, autogenerate: true}
  #@foreign_key_type :binary_id
  schema "users" do
    field :email, :string
    field :password, :string
    field :username, :string
    has_many :games, Captur.Games.Game
    has_many :participants, Captur.Games.Participant
    timestamps()
  end

  @doc false
  def changeset(user, attrs) do
    user
    |> cast(attrs, [:username, :email, :password])
    |> validate_required([:username, :email, :password])
  end
end
