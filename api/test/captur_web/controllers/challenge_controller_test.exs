defmodule CapturWeb.ChallengeControllerTest do
  use CapturWeb.ConnCase

  alias Captur.Games
  alias Captur.Games.Challenge

  @create_attrs %{
    answer: "some answer",
    body: "some body",
    body_format: "some body_format",
    description: "some description",
    end_date: ~N[2010-04-17 14:00:00],
    explanation: "some explanation",
    explanation_format: "some explanation_format",
    hidden: true,
    points: 42,
    start_date: ~N[2010-04-17 14:00:00],
    title: "some title"
  }
  @update_attrs %{
    answer: "some updated answer",
    body: "some updated body",
    body_format: "some updated body_format",
    description: "some updated description",
    end_date: ~N[2011-05-18 15:01:01],
    explanation: "some updated explanation",
    explanation_format: "some updated explanation_format",
    hidden: false,
    points: 43,
    start_date: ~N[2011-05-18 15:01:01],
    title: "some updated title"
  }
  @invalid_attrs %{answer: nil, body: nil, body_format: nil, description: nil, end_date: nil, explanation: nil, explanation_format: nil, hidden: nil, points: nil, start_date: nil, title: nil}

  def fixture(:challenge) do
    {:ok, challenge} = Games.create_challenge(@create_attrs)
    challenge
  end

  setup %{conn: conn} do
    {:ok, conn: put_req_header(conn, "accept", "application/json")}
  end

  describe "index" do
    test "lists all challenges", %{conn: conn} do
      conn = get(conn, Routes.challenge_path(conn, :index))
      assert json_response(conn, 200)["data"] == []
    end
  end

  describe "create challenge" do
    test "renders challenge when data is valid", %{conn: conn} do
      conn = post(conn, Routes.challenge_path(conn, :create), challenge: @create_attrs)
      assert %{"id" => id} = json_response(conn, 201)["data"]

      conn = get(conn, Routes.challenge_path(conn, :show, id))

      assert %{
               "id" => id,
               "answer" => "some answer",
               "body" => "some body",
               "body_format" => "some body_format",
               "description" => "some description",
               "end_date" => "2010-04-17T14:00:00",
               "explanation" => "some explanation",
               "explanation_format" => "some explanation_format",
               "hidden" => true,
               "points" => 42,
               "start_date" => "2010-04-17T14:00:00",
               "title" => "some title"
             } = json_response(conn, 200)["data"]
    end

    test "renders errors when data is invalid", %{conn: conn} do
      conn = post(conn, Routes.challenge_path(conn, :create), challenge: @invalid_attrs)
      assert json_response(conn, 422)["errors"] != %{}
    end
  end

  describe "update challenge" do
    setup [:create_challenge]

    test "renders challenge when data is valid", %{conn: conn, challenge: %Challenge{id: id} = challenge} do
      conn = put(conn, Routes.challenge_path(conn, :update, challenge), challenge: @update_attrs)
      assert %{"id" => ^id} = json_response(conn, 200)["data"]

      conn = get(conn, Routes.challenge_path(conn, :show, id))

      assert %{
               "id" => id,
               "answer" => "some updated answer",
               "body" => "some updated body",
               "body_format" => "some updated body_format",
               "description" => "some updated description",
               "end_date" => "2011-05-18T15:01:01",
               "explanation" => "some updated explanation",
               "explanation_format" => "some updated explanation_format",
               "hidden" => false,
               "points" => 43,
               "start_date" => "2011-05-18T15:01:01",
               "title" => "some updated title"
             } = json_response(conn, 200)["data"]
    end

    test "renders errors when data is invalid", %{conn: conn, challenge: challenge} do
      conn = put(conn, Routes.challenge_path(conn, :update, challenge), challenge: @invalid_attrs)
      assert json_response(conn, 422)["errors"] != %{}
    end
  end

  describe "delete challenge" do
    setup [:create_challenge]

    test "deletes chosen challenge", %{conn: conn, challenge: challenge} do
      conn = delete(conn, Routes.challenge_path(conn, :delete, challenge))
      assert response(conn, 204)

      assert_error_sent 404, fn ->
        get(conn, Routes.challenge_path(conn, :show, challenge))
      end
    end
  end

  defp create_challenge(_) do
    challenge = fixture(:challenge)
    {:ok, challenge: challenge}
  end
end
