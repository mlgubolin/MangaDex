defmodule MangaDexWeb.Publications.AuthorController do
  use MangaDexWeb, :controller
  alias MangaDex.Schemas.Author
  alias MangaDex.Repo
  alias MangaDexWeb.Publications

  def index(conn, _) do
    conn
    |> json(Repo.all(Author))
    |> put_status(200)
  end

  def show(conn, %{"id" => id}) do
    Repo.get(Author, id)

    conn
    |> put_status(200)
  end


  def create(conn, params) do
    case Publications.register_author(params) do
      {:ok, author} ->
        conn
        |> put_flash(:info, "#{author.name} created!")
        |> put_status(201)
        |> json(%{"id" => author.id})

      {:error, _} ->
        conn
        |> put_status(500)
        |> json(%{})
    end
  end

  # \\

  # %{"id" => id, "name" => name}) do
  def update(_conn, _) do
    # from(a in Author, where: p.id == id, select: p.visits)
    #   |> Repo.update_all(set: [title: "New title"])
    # Repo.update()
  end

  def delete(_conn, _params) do
  end
end
