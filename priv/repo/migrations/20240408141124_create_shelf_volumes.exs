defmodule MangaDex.Repo.Migrations.CreateShelfVolumes do
  use Ecto.Migration

  def change do
    create table(:shelf_volumes, primary_key: false) do
      add :shelves_id, references(:shelves), primary_key: true
      add :volume_id, references(:volumes), primary_key: true

      timestamps(type: :utc_datetime)
    end
  end
end

# create_table(:user_volume_status, primary_key: false) do
#   add :user_id, references(:users), primary_key: true
#   add :volume_id, references(:volumes), primary_key: true
#   add :status, :string, null: false
# end
