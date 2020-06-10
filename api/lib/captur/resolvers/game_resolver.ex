defmodule Captur.GameResolver do
  alias Captur.Games

  def all(_args, _info) do
    {:ok, Games.list_games()}
  end
end