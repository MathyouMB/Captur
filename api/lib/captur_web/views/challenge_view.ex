defmodule CapturWeb.ChallengeView do
  use CapturWeb, :view
  alias CapturWeb.ChallengeView

  def render("index.json", %{challenges: challenges}) do
    %{data: render_many(challenges, ChallengeView, "challenge.json")}
  end

  def render("show.json", %{challenge: challenge}) do
    %{data: render_one(challenge, ChallengeView, "challenge.json")}
  end

  def render("challenge.json", %{challenge: challenge}) do
    %{id: challenge.id,
      title: challenge.title,
      description: challenge.description,
      body: challenge.body,
      body_format: challenge.body_format,
      answer: challenge.answer,
      explanation: challenge.explanation,
      explanation_format: challenge.explanation_format,
      points: challenge.points,
      start_date: challenge.start_date,
      end_date: challenge.end_date,
      hidden: challenge.hidden}
  end
end
