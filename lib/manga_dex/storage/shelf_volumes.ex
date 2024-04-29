defmodule MangaDex.Storage.ShelfVolumes do
  use Ecto.Schema
  import Ecto.Changeset

  schema "shelf_volumes" do
    field :amount, :integer
    field :shelf_id, :id
    field :volume_id, :id

    timestamps(type: :utc_datetime)
  end

  @doc false
  def changeset(shelf_volumes, attrs) do
    shelf_volumes
    |> cast(attrs, [:amount])
    |> validate_required([:amount])
  end
end
