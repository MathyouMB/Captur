defmodule CapturWeb.Router do
  use CapturWeb, :router

  pipeline :api do
    plug :accepts, ["json"]
  end

  scope "/api", CapturWeb do
    pipe_through :api
    resources "/users", UserController
    resources "/games", GameController
    resources "/participants", ParticipantController
  end
end
