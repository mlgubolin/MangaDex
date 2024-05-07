defmodule MangaDexWeb.AuthorController do
  use MangaDexWeb, :controller
  alias MangaDex.Publications
  alias MangaDex.Publications.Author

  def index(conn, _params) do
    authors = Publications.list_authors()
    render(conn, :index, authors: authors)
  end

  def new(conn, _params) do
    changeset = Publications.change_author(%Author{})
    render(conn, :new, changeset: changeset)
  end

  def create(conn, %{"author" => author_params}) do
    case Publications.create_author(author_params) do
      {:ok, author} ->
        conn
        |> put_flash(:info, "Author created successfully.")
        |> redirect(to: ~p"/authors/#{author}")

      {:error, %Ecto.Changeset{} = changeset} ->
        render(conn, :new, changeset: changeset)
    end
  end

  def show(conn, %{"id" => id}) do
    author = Publications.get_author!(id)
    render(conn, :show, author: author)
  end

  def edit(conn, %{"id" => id}) do
    author = Publications.get_author!(id)
    changeset = Publications.change_author(author)
    render(conn, :edit, author: author, changeset: changeset)#, available_series: series)
  end

  def update(conn, %{"id" => id, "author" => author_params}) do
    author = Publications.get_author!(id)
    case Publications.update_author(author, author_params) do
      {:ok, author} ->
        conn
        |> put_flash(:info, "Author updated successfully.")
        |> redirect(to: ~p"/authors/#{author}")

      {:error, %Ecto.Changeset{} = changeset} ->
        render(conn, :edit, author: author, changeset: changeset)
    end
  end

  def delete(conn, %{"id" => id}) do
    author = Publications.get_author!(id)
    {:ok, _author} = Publications.delete_author(author)

    conn
    |> put_flash(:info, "Author deleted successfully.")
    |> redirect(to: ~p"/authors")
  end
end
