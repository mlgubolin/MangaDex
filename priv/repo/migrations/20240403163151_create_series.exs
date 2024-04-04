defmodule MangaDex.Repo.Migrations.CreateSeries do
  use Ecto.Migration

  def change do
    create table(:series) do
      add :name, :string

      timestamps(type: :utc_datetime)
    end
  end
end
