defmodule MangaDex.Storage.ShelfVolumes do
  alias MangaDex.Storage.Shelf
  alias MangaDex.Publications.Volume
  use Ecto.Schema
  import Ecto.Changeset

  schema "shelf_volumes" do
    belongs_to :shelves, Shelf
    belongs_to :volumes, Volume

    timestamps(type: :utc_datetime)
  end

  @doc false
  def changeset(shelf_volumes, attrs) do
    shelf_volumes
    |> cast(attrs, [:amount])
    |> validate_required([:amount])
  end
end
