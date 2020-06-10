defmodule CapturWeb.RewardView do
  use CapturWeb, :view
  alias CapturWeb.RewardView

  def render("index.json", %{rewards: rewards}) do
    %{data: render_many(rewards, RewardView, "reward.json")}
  end

  def render("show.json", %{reward: reward}) do
    %{data: render_one(reward, RewardView, "reward.json")}
  end

  def render("reward.json", %{reward: reward}) do
    %{id: reward.id}
  end
end
