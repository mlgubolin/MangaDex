defmodule MangaDex.Storage.UserShelf do
  use Ecto.Schema
  import Ecto.Changeset

  schema "user_shelves" do
    field :permission, Ecto.Enum, values: [:admin, :read, :none]
    field :user_id, :id
    field :shelves_id, :id

    timestamps(type: :utc_datetime)
  end

  @doc false
  def changeset(user_shelf, attrs) do
    user_shelf
    |> cast(attrs, [:permission])
    |> validate_required([:permission])
  end
end
