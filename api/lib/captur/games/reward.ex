defmodule Captur.Games.Reward do
  use Ecto.Schema
  import Ecto.Changeset


  schema "rewards" do
    field :bonus_points, :integer
    timestamps()
  end

  @doc false
  def changeset(reward, attrs) do
    reward
    |> cast(attrs, [])
    |> validate_required([])
  end
end
