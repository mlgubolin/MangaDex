defmodule MangaDex.MangaDex.Volume do
  use Ecto.Schema
  import Ecto.Changeset

  schema "volumes" do
    field :number, :integer
    field :cover_image_uri, :binary
    many_to_many :serie, MangaDex.MangaDex.Serie, join_through: "shelf_volumes"

    timestamps(type: :utc_datetime)
  end

  @doc false
  def changeset(volume, attrs) do
    volume
    |> cast(attrs, [:number, :cover_image_uri])
    |> validate_required([:number, :cover_image_uri])
  end
end
