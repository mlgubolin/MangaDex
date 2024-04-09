defmodule MangaDex.Schemas.ShelfVolumes do
  use Ecto.Schema
  import Ecto.Changeset

  schema "shelf_volumes" do
    belongs_to :shelves, MangaDex.Schemas.Shelf
    belongs_to :volumes, MangaDex.Schemas.Volume

    timestamps(type: :utc_datetime)
  end

  @doc false
  def changeset(self_volumes, attrs) do
    self_volumes
    |> cast(attrs, [])
    |> validate_required([])
  end
end
