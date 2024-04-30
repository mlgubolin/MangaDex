defmodule MangaDex.Publications.Volume do
  use Ecto.Schema
  import Ecto.Changeset
  alias MangaDex.Publications.Serie

  schema "volumes" do
    field :number, :integer
    field :cover_image_uri, :string
    many_to_many :serie, Serie, join_through: "shelf_volumes"

    timestamps(type: :utc_datetime)
  end

  @doc false
  def changeset(volume, attrs) do
    volume
    |> cast(attrs, [:number])
    |> validate_required([:number])
  end
end
