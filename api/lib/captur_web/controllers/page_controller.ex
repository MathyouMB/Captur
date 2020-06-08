defmodule CapturWeb.PageController do
  use CapturWeb, :controller

  def index(conn, _params) do
    render(conn, "index.html")
  end
end
