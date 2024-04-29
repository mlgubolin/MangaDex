defmodule MangaDex.Publications.Serie do
  use Ecto.Schema
  import Ecto.Changeset

  schema "series" do
    field :name, :string

    timestamps(type: :utc_datetime)
  end

  @doc false
  def changeset(serie, attrs) do
    serie
    |> cast(attrs, [:name])
    |> validate_required([:name])
  end
end
