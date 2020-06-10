defmodule CapturWeb.RewardControllerTest do
  use CapturWeb.ConnCase

  alias Captur.Games
  alias Captur.Games.Reward

  @create_attrs %{

  }
  @update_attrs %{

  }
  @invalid_attrs %{}

  def fixture(:reward) do
    {:ok, reward} = Games.create_reward(@create_attrs)
    reward
  end

  setup %{conn: conn} do
    {:ok, conn: put_req_header(conn, "accept", "application/json")}
  end

  describe "index" do
    test "lists all rewards", %{conn: conn} do
      conn = get(conn, Routes.reward_path(conn, :index))
      assert json_response(conn, 200)["data"] == []
    end
  end

  describe "create reward" do
    test "renders reward when data is valid", %{conn: conn} do
      conn = post(conn, Routes.reward_path(conn, :create), reward: @create_attrs)
      assert %{"id" => id} = json_response(conn, 201)["data"]

      conn = get(conn, Routes.reward_path(conn, :show, id))

      assert %{
               "id" => id
             } = json_response(conn, 200)["data"]
    end

    test "renders errors when data is invalid", %{conn: conn} do
      conn = post(conn, Routes.reward_path(conn, :create), reward: @invalid_attrs)
      assert json_response(conn, 422)["errors"] != %{}
    end
  end

  describe "update reward" do
    setup [:create_reward]

    test "renders reward when data is valid", %{conn: conn, reward: %Reward{id: id} = reward} do
      conn = put(conn, Routes.reward_path(conn, :update, reward), reward: @update_attrs)
      assert %{"id" => ^id} = json_response(conn, 200)["data"]

      conn = get(conn, Routes.reward_path(conn, :show, id))

      assert %{
               "id" => id
             } = json_response(conn, 200)["data"]
    end

    test "renders errors when data is invalid", %{conn: conn, reward: reward} do
      conn = put(conn, Routes.reward_path(conn, :update, reward), reward: @invalid_attrs)
      assert json_response(conn, 422)["errors"] != %{}
    end
  end

  describe "delete reward" do
    setup [:create_reward]

    test "deletes chosen reward", %{conn: conn, reward: reward} do
      conn = delete(conn, Routes.reward_path(conn, :delete, reward))
      assert response(conn, 204)

      assert_error_sent 404, fn ->
        get(conn, Routes.reward_path(conn, :show, reward))
      end
    end
  end

  defp create_reward(_) do
    reward = fixture(:reward)
    {:ok, reward: reward}
  end
end
