defmodule CapturWeb.ParticipantController do
  use CapturWeb, :controller

  alias Captur.Games
  alias Captur.Games.Participant

  action_fallback CapturWeb.FallbackController

  def index(conn, _params) do
    participants = Games.list_participants()
    render(conn, "index.json", participants: participants)
  end

  def create(conn, %{"participant" => participant_params}) do
    with {:ok, %Participant{} = participant} <- Games.create_participant(participant_params) do
      conn
      |> put_status(:created)
      |> put_resp_header("location", Routes.participant_path(conn, :show, participant))
      |> render("show.json", participant: participant)
    end
  end

  def show(conn, %{"id" => id}) do
    participant = Games.get_participant!(id)
    render(conn, "show.json", participant: participant)
  end

  def update(conn, %{"id" => id, "participant" => participant_params}) do
    participant = Games.get_participant!(id)

    with {:ok, %Participant{} = participant} <- Games.update_participant(participant, participant_params) do
      render(conn, "show.json", participant: participant)
    end
  end

  def delete(conn, %{"id" => id}) do
    participant = Games.get_participant!(id)

    with {:ok, %Participant{}} <- Games.delete_participant(participant) do
      send_resp(conn, :no_content, "")
    end
  end
end
