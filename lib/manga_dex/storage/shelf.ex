defmodule MangaDex.Storage.Shelf do
  use Ecto.Schema
  import Ecto.Changeset

  schema "shelves" do
    field :name, :string
    field :volume_id, :id

    timestamps(type: :utc_datetime)
  end

  @doc false
  def changeset(shelf, attrs) do
    shelf
    |> cast(attrs, [:name])
    |> validate_required([:name])
  end
end
