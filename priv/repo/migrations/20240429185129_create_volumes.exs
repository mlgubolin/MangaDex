defmodule MangaDex.Repo.Migrations.CreateVolumes do
  use Ecto.Migration

  def change do
    create table(:volumes) do
      add :number, :integer
      add :cover_image_uri, :string
      add :serie_id, references(:series, on_delete: :nothing)

      timestamps(type: :utc_datetime)
    end

    create index(:volumes, [:serie_id])
  end
end
