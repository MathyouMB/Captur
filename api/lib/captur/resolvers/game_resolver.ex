defmodule Captur.GameResolver do
  alias Captur.Games

  def all(_args, _info) do
    {:ok, Games.list_games()}
  end

  def create(args, _info) do
    Games.create_game(args)
  end

  def update(%{id: id, game: game_params}, _info) do
    Games.get_game!(id)
    |> Games.update_game(game_params)
  end

  def delete(%{id: id}, _info) do
    Games.get_game!(id)
    |> Games.delete_game
  end
end