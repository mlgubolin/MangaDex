defmodule MangaDex.Repo.Migrations.CreateShelves do
  use Ecto.Migration

  def change do
    create table(:shelves) do
      add :name, :string
      add :volume_id, references(:volumes, on_delete: :nothing)

      timestamps(type: :utc_datetime)
    end

    create index(:shelves, [:volume_id])
  end
end
