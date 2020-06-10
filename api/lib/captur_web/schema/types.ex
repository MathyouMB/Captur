defmodule CapturWeb.Schema.Types do
  use Absinthe.Schema.Notation
  use Absinthe.Ecto, repo: Captur.Repo
  import_types Absinthe.Type.Custom

  object :user do
    field :id, :id
    field :username, :string
    field :email, :string
    field :password, :string
    field :games, list_of(:game), resolve: assoc(:games)
    field :participants, list_of(:participant), resolve: assoc(:participants)
  end

  object :participant do
    field :id, :id
    field :user, :user, resolve: assoc(:user)
    field :game, :game, resolve: assoc(:game)
  end

  object :game do
    field :id, :id
    field :title, :string
    field :description, :string
    field :start_date, :naive_datetime
    field :end_date, :naive_datetime
    field :hidden, :boolean
    field :owner, :user, resolve: assoc(:user)
    field :users, list_of(:user), resolve: assoc(:users)
    field :participants, list_of(:participant), resolve: assoc(:participants)
    field :challenges, list_of(:challenge), resolve: assoc(:challenges)
  end

  object :challenge do
    field :id, :id
    field :answer, :string
    field :body, :string
    field :body_format, :string
    field :description, :string
    field :end_date, :naive_datetime
    field :explanation, :string
    field :explanation_format, :string
    field :hidden, :boolean
    field :points, :integer
    field :start_date, :naive_datetime
    field :title, :string
    field :game, :game, resolve: assoc(:game)
  end

  object :reward do
    field :id, :id
    field :bonus_points, :integer
    field :participant, :participant, resolve: assoc(:participant)
    field :challenge, :challenge, resolve: assoc(:challenge)
  end

end