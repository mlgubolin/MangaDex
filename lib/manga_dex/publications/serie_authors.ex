defmodule MangaDex.Publications.SerieAuthors do
  use Ecto.Schema
  import Ecto.Changeset

  schema "serie_authors" do

    field :serie_id, :id
    field :author_id, :id
    field :role_id, :id

    timestamps(type: :utc_datetime)
  end

  @doc false
  def changeset(serie_authors, attrs) do
    serie_authors
    |> cast(attrs, [])
    |> validate_required([])
  end
end
