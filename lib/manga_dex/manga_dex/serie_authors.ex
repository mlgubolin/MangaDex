defmodule MangaDex.MangaDex.SerieAuthors do
  use Ecto.Schema
  import Ecto.Changeset

  schema "serie_authors" do
    belongs_to :serie, MangaDex.MangaDex.Serie
    belongs_to :author, MangaDex.MangaDex.Author
    belongs_to :role, MangaDex.MangaDex.Role

    timestamps(type: :utc_datetime)
  end

  @doc false
  def changeset(serie_authors, attrs) do
    serie_authors
    |> cast(attrs, [])
    |> validate_required([])
  end
end
