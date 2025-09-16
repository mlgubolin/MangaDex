defmodule Mangadex.Publication.Series do
  @moduledoc """
  Schema for publication series table.

  A publication series represents a collection of related publications
  (like manga volumes) that share common characteristics such as
  release format and status.
  """

  use Ecto.Schema
  import Ecto.Changeset

  @type t :: %__MODULE__{
    id: integer() | nil,
    title: String.t(),
    release_format: :webcomic | :physical,
    status: :ongoing | :completed | :cancelled | :hiatus,
    inserted_at: DateTime.t() | nil,
    updated_at: DateTime.t() | nil
  }
  schema "publication_series" do
    field :title, :string
    field :release_format, Ecto.Enum, values: [:webcomic, :physical]
    field :status, Ecto.Enum, values: [:ongoing, :completed, :cancelled, :hiatus]

    timestamps()
  end

  def new(params) do
    %__MODULE__{}
    |> changeset(params)
  end

  def update(series, params) do
    series
    |> changeset(params)
  end

  @doc """
  Changeset for creating or updating a publication series.
  """
  def changeset(publication_series, attrs) do
    publication_series
    |> cast(attrs, [:title, :release_format, :status])
    |> validate_required([:title, :release_format, :status])
    |> validate_length(:title, min: 1, max: 255)
    |> unique_constraint(:title, name: :publication_series_title_index)
  end


end
