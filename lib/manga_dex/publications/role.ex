defmodule MangaDex.Publications.Role do
  use Ecto.Schema
  import Ecto.Changeset

  schema "roles" do
    field :role, Ecto.Enum, values: [:writer, :illustrator]

    timestamps(type: :utc_datetime)
  end

  @doc false
  def changeset(role, attrs) do
    role
    |> cast(attrs, [:role])
    |> validate_required([:role])
  end
end
