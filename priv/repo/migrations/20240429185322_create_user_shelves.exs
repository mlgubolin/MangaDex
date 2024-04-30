defmodule MangaDex.Repo.Migrations.CreateUserShelves do
  use Ecto.Migration

  def change do
    create table(:user_shelves) do
      add :permission, :string
      add :user_id, references(:users, on_delete: :nothing)
      add :shelves_id, references(:shelves, on_delete: :nothing)

      timestamps(type: :utc_datetime)
    end

    create index(:user_shelves, [:user_id])
    create index(:user_shelves, [:shelves_id])
  end
end
