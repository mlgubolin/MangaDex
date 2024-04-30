defmodule MangaDex.Storage.UserShelf do
  alias MangaDex.Accounts.User
  alias MangaDex.Storage.Shelf
  use Ecto.Schema
  import Ecto.Changeset

  schema "user_shelves" do
    field :acl_role, Ecto.Enum, values: [:admin, :read]
    belongs_to :shelves, Shelf
    belongs_to :user, User


    timestamps(type: :utc_datetime)
  end

  @spec changeset(
          {map(), map()}
          | %{
              :__struct__ => atom() | %{:__changeset__ => map(), optional(any()) => any()},
              optional(atom()) => any()
            },
          :invalid | %{optional(:__struct__) => none(), optional(atom() | binary()) => any()}
        ) :: Ecto.Changeset.t()
  @doc false
  def changeset(user_shelf, attrs) do
    user_shelf
    |> cast(attrs, [:permission])
    |> validate_required([:permission])
  end
end
