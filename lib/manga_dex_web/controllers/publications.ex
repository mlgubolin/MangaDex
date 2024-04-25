defmodule MangaDexWeb.Publications do
  alias MangaDex.Schemas.Author
  alias MangaDex.Repo

  def register_author(params) do
    %Author{}
    |> Author.changeset(params)
    |> Repo.insert()
  end
end
