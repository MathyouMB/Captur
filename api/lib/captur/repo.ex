defmodule Captur.Repo do
  use Ecto.Repo,
    otp_app: :captur,
    adapter: Ecto.Adapters.Postgres
end
