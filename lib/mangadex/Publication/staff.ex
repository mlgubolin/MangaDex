defmodule Mangadex.Publication.Staff do
  @moduledoc """
  Schema for publication staff table.

  This is a join table that connects individuals (authors, writers, illustrators)
  to publication series and optionally to specific volumes. It tracks the role
  each individual plays in the publication.
  """

  use Ecto.Schema
  import Ecto.Changeset

  @type t :: %__MODULE__{
    id: integer() | nil,
    individual_id: integer(),
    series_id: integer(),
    volume_id: integer() | nil,
    role: :author | :writer | :illustrator,
    notes: String.t() | nil,
  }

  schema "publication_staff" do
    field :role, Ecto.Enum, values: [:author, :writer, :illustrator]
    field :notes, :string

    # Associations
    belongs_to :individual, Mangadex.Schemas.Individual
    belongs_to :publication, Mangadex.Publication.Series
    belongs_to :volume, Mangadex.Schemas.PublicationVolume
  end

  def new(publication, individual, params) do
    %__MODULE__{}
    |> changeset(params)
    |> put_assoc(:publication, publication)
    |> put_assoc(:individual, individual)
  end

  def update(publication_staff, params) do
    publication_staff
    |> changeset(params)
  end

  @doc """
  Changeset for creating or updating publication staff.
  """
  @spec changeset(t(), map()) :: Ecto.Changeset.t()
  def changeset(publication_staff, attrs) do
    publication_staff
    |> cast(attrs, [:role, :notes])
    |> validate_required([:role])
    |> validate_length(:notes, max: 1000)
    |> unique_constraint([:individual_id, :publication_id, :volume_id, :role],
         name: :publication_staff_unique_role_per_individual)
  end
end
