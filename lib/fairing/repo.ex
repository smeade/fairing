defmodule Fairing.Repo do
  use Ecto.Repo,
    otp_app: :fairing,
    adapter: Ecto.Adapters.Postgres
end
