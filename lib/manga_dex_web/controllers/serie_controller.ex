defmodule MangaDexWeb.SerieController do
  use MangaDexWeb, :controller

  alias MangaDex.Publications
  alias MangaDex.Publications.Serie

  def index(conn, _params) do
    series = Publications.list_series()
    render(conn, :index, series: series)
  end

  def new(conn, _params) do
    changeset = Publications.change_serie(%Serie{})
    render(conn, :new, changeset: changeset)
  end

  def create(conn, %{"serie" => serie_params}) do
    case Publications.create_serie(serie_params) do
      {:ok, serie} ->
        conn
        |> put_flash(:info, "Serie created successfully.")
        |> redirect(to: ~p"/series/#{serie}")

      {:error, %Ecto.Changeset{} = changeset} ->
        render(conn, :new, changeset: changeset)
    end
  end

  def show(conn, %{"id" => id}) do
    serie = Publications.get_serie!(id)
    render(conn, :show, serie: serie)
  end

  def edit(conn, %{"id" => id}) do
    serie = Publications.get_serie!(id)
    changeset = Publications.change_serie(serie)
    render(conn, :edit, serie: serie, changeset: changeset)
  end

  def update(conn, %{"id" => id, "serie" => serie_params}) do
    serie = Publications.get_serie!(id)

    case Publications.update_serie(serie, serie_params) do
      {:ok, serie} ->
        conn
        |> put_flash(:info, "Serie updated successfully.")
        |> redirect(to: ~p"/series/#{serie}")

      {:error, %Ecto.Changeset{} = changeset} ->
        render(conn, :edit, serie: serie, changeset: changeset)
    end
  end

  def delete(conn, %{"id" => id}) do
    serie = Publications.get_serie!(id)
    {:ok, _serie} = Publications.delete_serie(serie)

    conn
    |> put_flash(:info, "Serie deleted successfully.")
    |> redirect(to: ~p"/series")
  end
end
