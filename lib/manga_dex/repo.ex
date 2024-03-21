defmodule MangaDex.Repo do
  use Ecto.Repo,
    otp_app: :manga_dex,
    adapter: Ecto.Adapters.Postgres
end
