defmodule MangaDex.Repo.Migrations.CreateShelfVolumes do
  use Ecto.Migration

  def change do
    create table(:shelf_volumes) do
      # add :amount, :integer
      add :shelf_id, references(:shelves, on_delete: :nothing)
      add :volume_id, references(:volumes, on_delete: :nothing)

      timestamps(type: :utc_datetime)
    end

    create index(:shelf_volumes, [:shelf_id])
    create index(:shelf_volumes, [:volume_id])

    ##Searchables:

    execute """
    ALTER TABLE authors
      ADD COLUMN searchable tsvector
      GENERATED ALWAYS AS (
        setweight(
          to_tsvector('english', coalesce(name, '')), 'A'
        )
      ) STORED;
    """

    execute """
      CREATE INDEX authors_searchable_index ON authors USING gin(searchable);
    """

    execute """
    ALTER TABLE series
      ADD COLUMN searchable tsvector
      GENERATED ALWAYS AS (
        setweight(
          to_tsvector('english', coalesce(name, '')), 'A'
        )
      ) STORED;
    """

    execute """
    CREATE INDEX series_searchable_index ON series USING gin(searchable);
  """
  end
end
