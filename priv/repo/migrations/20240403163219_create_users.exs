defmodule MangaDex.Repo.Migrations.CreateUsers do
  use Ecto.Migration

  def change do
    create table(:users) do

      timestamps(type: :utc_datetime)
    end
  end
end
