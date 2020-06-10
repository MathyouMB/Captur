defmodule CapturWeb.Schema.Types do
  use Absinthe.Schema.Notation
  use Absinthe.Ecto, repo: Captur.Repo

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
    field :owner, :user, resolve: assoc(:user)
    field :users, list_of(:user), resolve: assoc(:users)
    field :participants, list_of(:participant), resolve: assoc(:participants)
  end

end