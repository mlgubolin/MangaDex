defmodule MangaDex.Repo.Migrations.CreateSerieAuthors do
  use Ecto.Migration

  def change do
    create table(:serie_authors) do
      add :serie_id, references(:series), null: false
      add :author_id, references(:authors), null: false
      add :role_id, references(:roles)

      timestamps(type: :utc_datetime)
    end

    create index(:serie_authors, [:serie_id])
    create index(:serie_authors, [:author_id])
  end
end
