defmodule CapturWeb.Schema do
  use Absinthe.Schema
  import_types CapturWeb.Schema.Types

  query do
    field :games, list_of(:game) do
      resolve &Captur.GameResolver.all/2
    end

    field :users, list_of(:user) do
      resolve &Captur.UserResolver.all/2
    end

    field :user, type: :user do
      arg :id, non_null(:id)
      resolve &Captur.UserResolver.find/2
    end
  end
end