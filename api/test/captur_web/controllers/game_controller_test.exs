defmodule CapturWeb.GameControllerTest do
  use CapturWeb.ConnCase

  alias Captur.Games
  alias Captur.Games.Game

  @create_attrs %{
    description: "some description",
    end_date: ~N[2010-04-17 14:00:00],
    hidden: true,
    start_date: ~N[2010-04-17 14:00:00],
    title: "some title"
  }
  @update_attrs %{
    description: "some updated description",
    end_date: ~N[2011-05-18 15:01:01],
    hidden: false,
    start_date: ~N[2011-05-18 15:01:01],
    title: "some updated title"
  }
  @invalid_attrs %{description: nil, end_date: nil, hidden: nil, start_date: nil, title: nil}

  def fixture(:game) do
    {:ok, game} = Games.create_game(@create_attrs)
    game
  end

  setup %{conn: conn} do
    {:ok, conn: put_req_header(conn, "accept", "application/json")}
  end

  describe "index" do
    test "lists all games", %{conn: conn} do
      conn = get(conn, Routes.game_path(conn, :index))
      assert json_response(conn, 200)["data"] == []
    end
  end

  describe "create game" do
    test "renders game when data is valid", %{conn: conn} do
      conn = post(conn, Routes.game_path(conn, :create), game: @create_attrs)
      assert %{"id" => id} = json_response(conn, 201)["data"]

      conn = get(conn, Routes.game_path(conn, :show, id))

      assert %{
               "id" => id,
               "description" => "some description",
               "end_date" => "2010-04-17T14:00:00",
               "hidden" => true,
               "start_date" => "2010-04-17T14:00:00",
               "title" => "some title"
             } = json_response(conn, 200)["data"]
    end

    test "renders errors when data is invalid", %{conn: conn} do
      conn = post(conn, Routes.game_path(conn, :create), game: @invalid_attrs)
      assert json_response(conn, 422)["errors"] != %{}
    end
  end

  describe "update game" do
    setup [:create_game]

    test "renders game when data is valid", %{conn: conn, game: %Game{id: id} = game} do
      conn = put(conn, Routes.game_path(conn, :update, game), game: @update_attrs)
      assert %{"id" => ^id} = json_response(conn, 200)["data"]

      conn = get(conn, Routes.game_path(conn, :show, id))

      assert %{
               "id" => id,
               "description" => "some updated description",
               "end_date" => "2011-05-18T15:01:01",
               "hidden" => false,
               "start_date" => "2011-05-18T15:01:01",
               "title" => "some updated title"
             } = json_response(conn, 200)["data"]
    end

    test "renders errors when data is invalid", %{conn: conn, game: game} do
      conn = put(conn, Routes.game_path(conn, :update, game), game: @invalid_attrs)
      assert json_response(conn, 422)["errors"] != %{}
    end
  end

  describe "delete game" do
    setup [:create_game]

    test "deletes chosen game", %{conn: conn, game: game} do
      conn = delete(conn, Routes.game_path(conn, :delete, game))
      assert response(conn, 204)

      assert_error_sent 404, fn ->
        get(conn, Routes.game_path(conn, :show, game))
      end
    end
  end

  defp create_game(_) do
    game = fixture(:game)
    {:ok, game: game}
  end
end
