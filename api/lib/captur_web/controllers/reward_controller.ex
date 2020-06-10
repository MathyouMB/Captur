defmodule CapturWeb.RewardController do
  use CapturWeb, :controller

  alias Captur.Games
  alias Captur.Games.Reward

  action_fallback CapturWeb.FallbackController

  def index(conn, _params) do
    rewards = Games.list_rewards()
    render(conn, "index.json", rewards: rewards)
  end

  def create(conn, %{"reward" => reward_params}) do
    with {:ok, %Reward{} = reward} <- Games.create_reward(reward_params) do
      conn
      |> put_status(:created)
      |> put_resp_header("location", Routes.reward_path(conn, :show, reward))
      |> render("show.json", reward: reward)
    end
  end

  def show(conn, %{"id" => id}) do
    reward = Games.get_reward!(id)
    render(conn, "show.json", reward: reward)
  end

  def update(conn, %{"id" => id, "reward" => reward_params}) do
    reward = Games.get_reward!(id)

    with {:ok, %Reward{} = reward} <- Games.update_reward(reward, reward_params) do
      render(conn, "show.json", reward: reward)
    end
  end

  def delete(conn, %{"id" => id}) do
    reward = Games.get_reward!(id)

    with {:ok, %Reward{}} <- Games.delete_reward(reward) do
      send_resp(conn, :no_content, "")
    end
  end
end
