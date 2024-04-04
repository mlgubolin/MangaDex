defmodule MangaDex.MangaDex.Author do
  use Ecto.Schema
  import Ecto.Changeset

  schema "authors" do
    field :name, :string

    many_to_many :series, Mangadex.MangaDex.Serie, join_through: "serie_authors"
    has_many :roles, Mangadex.MangaDex.SerieAuthors, foreign_key: :author_id

    timestamps(type: :utc_datetime)
  end

  # author = Repo.get(Author, 123)
  #
  # author = Repo.preload(author, :series)
  # author.series
  # [%Serie{}, %Serie{}]
  #
  # author = Repo.preload(author, roles: :series)
  # %{author | series: Enum.map(author.roles, &1.)}
  #
  # author = Repo.preload(author, roles: [:serie, :role])
  # author.roles
  # [%SerieAuthors{serie: %Serie{}, role: %Role{name: __struct__()}}]
  # [{"Escritor", %Serie{}}, {"Ilustrador", %Serie{}}, {"Escrtor", %Serie{}}]

  @doc false
  def changeset(author, attrs) do
    author
    |> cast(attrs, [:name])
    |> validate_required([:name])
  end
end
