defmodule MangaDex.Publications.Author do
  alias MangaDex.Publications.SerieAuthors
  use Ecto.Schema
  import Ecto.Changeset

  schema "authors" do
    field :name, :string
    has_many :series, SerieAuthors, foreign_key: :author_id

    timestamps(type: :utc_datetime)
  end

  @doc false
  def changeset(author, attrs) do
    author
    |> cast(attrs, [:name])
    |> validate_required([:name])
  end
end
