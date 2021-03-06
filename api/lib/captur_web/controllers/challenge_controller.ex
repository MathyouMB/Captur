defmodule CapturWeb.ChallengeController do
  use CapturWeb, :controller

  alias Captur.Games
  alias Captur.Games.Challenge

  action_fallback CapturWeb.FallbackController

  def index(conn, _params) do
    challenges = Games.list_challenges()
    render(conn, "index.json", challenges: challenges)
  end

  #def create(conn, %{"challenge" => challenge_params}) do
  #  with {:ok, %Challenge{} = challenge} <- Games.create_challenge(challenge_params) do
  #    conn
  #    |> put_status(:created)
  #    |> put_resp_header("location", Routes.challenge_path(conn, :show, challenge))
  #    |> render("show.json", challenge: challenge)
  #  end
  #end

  def show(conn, %{"id" => id}) do
    challenge = Games.get_challenge!(id)
    render(conn, "show.json", challenge: challenge)
  end

  def update(conn, %{"id" => id, "challenge" => challenge_params}) do
    challenge = Games.get_challenge!(id)

    with {:ok, %Challenge{} = challenge} <- Games.update_challenge(challenge, challenge_params) do
      render(conn, "show.json", challenge: challenge)
    end
  end

  def delete(conn, %{"id" => id}) do
    challenge = Games.get_challenge!(id)

    with {:ok, %Challenge{}} <- Games.delete_challenge(challenge) do
      send_resp(conn, :no_content, "")
    end
  end
end
