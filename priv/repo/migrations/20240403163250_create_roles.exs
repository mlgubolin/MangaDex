defmodule MangaDex.Repo.Migrations.CreateRoles do
  use Ecto.Migration

  def change do
    create table(:roles) do
      add :role, :string, null: false

      timestamps(type: :utc_datetime)
    end
  end
end
