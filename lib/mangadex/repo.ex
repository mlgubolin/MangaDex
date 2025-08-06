defmodule Mangadex.Repo do
  use Ecto.Repo,
    otp_app: :mangadex,
    adapter: Ecto.Adapters.Postgres
end
