defmodule MangaDex.Repo.Migrations.CreateShelves do
  use Ecto.Migration

  def change do
    create table(:shelves) do
      add :name, :string, null: false

      timestamps(type: :utc_datetime)
    end
  end
end
