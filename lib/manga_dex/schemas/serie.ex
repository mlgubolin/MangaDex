defmodule MangaDex.Schemas.Serie do
  use Ecto.Schema
  import Ecto.Changeset

  schema "series" do
    field :name, :string

    many_to_many :authors, MangaDex.Schemas.Author, join_through: "serie_authors"
    has_many :roles, MangaDex.Schemas.SerieAuthors, foreign_key: :serie_id

    timestamps(type: :utc_datetime)
  end

  # serie = Repo.get(Serie, 101922) |> Repo.preload([serie_authors: [:role, :author]:author])
  # %Serie{
  #   name: "Kimetsu no Yabai",
  #   serie_authors: [
  #     %SerieAuthor{
  #       role: %Role{name: "Story & Art"},
  #       author: %Author{
  #         name: "Koyoharu"
  #       }
  #     },
  #     %SerieAuthor{
  #       role: %Role{name: "Assistant"},
  #       author: %Author{
  #         name: "Mizuki"
  #       }
  #     }
  #   ]
  # }

  @doc false
  def changeset(serie, attrs) do
    serie
    |> cast(attrs, [:name])
    |> validate_required([:name])
  end
end
