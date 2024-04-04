defmodule MangaDex.Repo.Migrations.CreateSerieAuthors do
  use Ecto.Migration

  def change do
    create table(:serie_authors) do
      add :serie_id, references(:series, on_delete: :nothing)
      add :author_id, references(:authors, on_delete: :nothing)
      add :role_id, references(:roles, on_delete: :nothing)

      timestamps(type: :utc_datetime)
    end

    create index(:serie_authors, [:serie_id])
    create index(:serie_authors, [:author_id])
    create index(:serie_authors, [:role_id])
  end
end
