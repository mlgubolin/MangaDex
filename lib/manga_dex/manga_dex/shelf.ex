defmodule MangaDex.MangaDex.Shelf do
  use Ecto.Schema
  import Ecto.Changeset

  schema "shelves" do
    field :name, :string
    many_to_many :users, MangaDex.MangaDex.User, join_through: "user_shelf"
    many_to_many :volumes, MangaDex.MangaDex.Volume, join_through: "shelf_volumes"

    timestamps(type: :utc_datetime)
  end

  @doc false
  def changeset(shelf, attrs) do
    shelf
    |> cast(attrs, [:name])
    |> validate_required([:name])
  end
end