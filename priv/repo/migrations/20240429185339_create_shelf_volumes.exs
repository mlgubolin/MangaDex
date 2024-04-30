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
  end
end
