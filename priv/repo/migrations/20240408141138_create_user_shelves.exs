defmodule MangaDex.Repo.Migrations.CreateUserShelves do
  use Ecto.Migration

  def change do
    create table(:user_shelves) do
      add :permission, :string
      add :user_id, references(:users, on_delete: :nothing)
      add :shelf_id, references(:shelf_id, on_delete: :nothing)

      timestamps(type: :utc_datetime)
    end

    create index(:user_shelves, [:user_id])
    create index(:user_shelves, [:self_id])
  end
end
