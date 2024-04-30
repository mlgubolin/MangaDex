defmodule MangaDex.Publications.Serie do
  use Ecto.Schema
  import Ecto.Changeset
  alias MangaDex.Publications.SerieAuthors
  alias MangaDex.Publications.Author

  schema "series" do
    field :name, :string

    many_to_many :authors, Author, join_through: "serie_authors"
    has_many :roles, SerieAuthors, foreign_key: :serie_id



    timestamps(type: :utc_datetime)
  end

  @doc false
  def changeset(serie, attrs) do
    serie
    |> cast(attrs, [:name])
    |> validate_required([:name])
  end
end
