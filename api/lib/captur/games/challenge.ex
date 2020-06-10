defmodule Captur.Games.Challenge do
  use Ecto.Schema
  import Ecto.Changeset

  schema "challenges" do
    field :answer, :string
    field :body, :string
    field :body_format, :string
    field :description, :string
    field :end_date, :naive_datetime
    field :explanation, :string
    field :explanation_format, :string
    field :hidden, :boolean, default: false
    field :points, :integer
    field :start_date, :naive_datetime
    field :title, :string
    belongs_to :game, Captur.Games.Game

    timestamps()
  end

  @doc false
  def changeset(challenge, attrs) do
    challenge
    |> cast(attrs, [:title, :description, :body, :body_format, :answer, :explanation, :explanation_format, :points, :start_date, :end_date, :hidden])
    |> validate_required([:title, :description, :body, :body_format, :answer, :explanation, :explanation_format, :points, :start_date, :end_date, :hidden])
  end
end
