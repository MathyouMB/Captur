defmodule CapturWeb.GameView do
  use CapturWeb, :view
  alias CapturWeb.GameView

  def render("index.json", %{games: games}) do
    %{data: render_many(games, GameView, "game.json")}
  end

  def render("show.json", %{game: game}) do
    %{data: render_one(game, GameView, "game.json")}
  end

  def render("game.json", %{game: game}) do
    %{id: game.id,
      title: game.title,
      description: game.description,
      start_date: game.start_date,
      end_date: game.end_date,
      hidden: game.hidden,
      user_id: game.user_id}
  end
end
