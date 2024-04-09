defmodule MangaDex.Schemas.UserShelf do
  use Ecto.Schema
  import Ecto.Changeset

  schema "user_shelves" do
    field :acl_role, Ecto.Enum, values: [:admin, :read]
    belongs_to :shelves, MangaDex.Schemas.Shelf
    belongs_to :user, MangaDex.Schemas.User

    timestamps(type: :utc_datetime)
  end

  @doc false
  def changeset(user_shelf, attrs) do
    user_shelf
    |> cast(attrs, [:acl_role])
    |> validate_required([:acl_role])
  end
end
