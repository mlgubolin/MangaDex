defmodule MangaDex.Publications.Volume do
  use Ecto.Schema
  import Ecto.Changeset

  schema "volumes" do
    field :number, :integer
    field :serie_id, :id

    timestamps(type: :utc_datetime)
  end

  @doc false
  def changeset(volume, attrs) do
    volume
    |> cast(attrs, [:number])
    |> validate_required([:number])
  end
end
