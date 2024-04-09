defmodule MangaDex.Repo.Migrations.CreateUserShelves do
  use Ecto.Migration

  def change do
    create table(:user_shelves, primary_key: false) do
      add :user_id, references(:users), primary_key: true
      add :shelf_id, references(:shelf_id), primary_key: true
      add :acl_role, :string, null: false

      timestamps(type: :utc_datetime)
    end
  end
end
