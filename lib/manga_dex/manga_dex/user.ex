defmodule MangaDex.MangaDex.User do
  use Ecto.Schema
  import Ecto.Changeset

  schema "users" do
    many_to_many :shelves, MangaDex.MangaDex.Shelf, join_through: "user_shelf"

    timestamps(type: :utc_datetime)
  end

  @doc false
  def changeset(user, attrs) do
    user
    |> cast(attrs, [])
    |> validate_required([])
  end
end
