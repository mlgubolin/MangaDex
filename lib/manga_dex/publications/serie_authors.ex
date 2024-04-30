defmodule MangaDex.Publications.SerieAuthors do
  use Ecto.Schema
  import Ecto.Changeset

  schema "serie_authors" do
    belongs_to :serie, MangaDex.Schemas.Serie
    belongs_to :author, MangaDex.Schemas.Author
    belongs_to :role, MangaDex.Schemas.Role

    timestamps(type: :utc_datetime)
  end

  @doc false
  def changeset(serie_authors, attrs) do
    serie_authors
    |> cast(attrs, [])
    |> validate_required([])
  end
end
