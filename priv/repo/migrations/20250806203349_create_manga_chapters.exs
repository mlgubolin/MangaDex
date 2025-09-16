defmodule Livescreaming.Repo.Migrations.CreateMangaVolumes do
  use Ecto.Migration

  def change do

    create table(:publication_series) do
      add :title, :string, null: false
      add :release_format, :string, null: false
      add :status, :string, null: false
    end

    create unique_index(:publication_series, [:title])

    # TODO: Add GiST title index

    create table(:individuals) do
      add :name, :string, null: false
    end

    create table(:publication_volumes) do
      add :title, :string, null: false
      add :series_id, references(:publication_series), null: false
      # add :publisher_id, references(:publishers)
      add :pages, :integer
      add :release_date, :date
      add :isbn, :string

      timestamps()
    end


    create table(:publication_staff) do
      add :individual_id, references(:individuals), null: false
      add :publication_id, references(:publication_series), null: false
      add :volume_id, references(:publication_volumes)
      add :role, :string, null: false
      add :notes, :string
    end

    create index(:publication_staff, [:individual_id])
    create index(:publication_staff, [:publication_id])


    create index(:publication_volumes, [:series_id, :release_date])
  end
end
