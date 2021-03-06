defmodule Captur.Games.Game do
  use Ecto.Schema
  import Ecto.Changeset

  #@primary_key {:id, :binary_id, autogenerate: true}
  #@foreign_key_type :binary_id
  schema "games" do
    field :description, :string
    field :end_date, :naive_datetime
    field :hidden, :boolean, default: false
    field :start_date, :naive_datetime
    field :title, :string
    belongs_to :user, Captur.Games.User
    has_many :participants, Captur.Games.Participant
    has_many :challenges, Captur.Games.Challenge
    has_many :users,
      through: [:participants, :user]
    #many_to_many :users, Capter.Games.User, join_through: "participants"
    timestamps()
  end

  @doc false
  def changeset(game, attrs) do
    game
    |> cast(attrs, [:title, :description, :start_date, :end_date, :hidden])
    |> validate_required([:title, :description, :start_date, :end_date, :hidden])
  end
end
