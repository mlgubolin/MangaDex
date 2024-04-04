defmodule MangaDex.MangaDex.SerieAuthors do
  use Ecto.Schema
  import Ecto.Changeset

  schema "serie_authors" do
    belongs_to :serie, Mangadex.MangaDex.Serie 
    belongs_to :author, Mangadex.MangaDex.Author
    belongs_to :role, Mangadex.MangaDex.Role
    
    timestamps(type: :utc_datetime)
  end

  @doc false
  def changeset(serie_authors, attrs) do
    serie_authors
    |> cast(attrs, [])
    |> validate_required([])
  end
end



# Serie
#       \
#         SerieAuthors - Role
#       /
# Author