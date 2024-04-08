defmodule MangaDex.MangaDex.ShelfVolumes do
  use Ecto.Schema
  import Ecto.Changeset

  schema "shelf_volumes" do
    field :amount, :integer
    belongs_to :shelves, MangaDex.MangaDex.Shelf
    belongs_to :volumes, MangaDex.MangaDex.Volume

    timestamps(type: :utc_datetime)
  end

  @doc false
  def changeset(self_volumes, attrs) do
    self_volumes
    |> cast(attrs, [:amount])
    |> validate_required([:amount])
  end
end
