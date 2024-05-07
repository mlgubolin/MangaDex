defmodule MangaDex.Publications do
  @moduledoc """
  The Publications context.
  """

import Ecto.Query, warn: false
alias MangaDex.Repo

  alias MangaDex.Publications.Author
  alias MangaDex.Publications.Serie

  @doc """
  Returns the list of series.

  ## Examples

      iex> list_series()
      [%Serie{}, ...]

  """
  def list_series do
    Repo.all(Serie)
  end

  @doc """
  Gets a single serie.

  Raises `Ecto.NoResultsError` if the Serie does not exist.

  ## Examples

      iex> get_serie!(123)
      %Serie{}

      iex> get_serie!(456)
      ** (Ecto.NoResultsError)

  """
  def get_serie!(id), do: Repo.get!(Serie, id)

  @doc """
  Creates a serie.

  ## Examples

      iex> create_serie(%{field: value})
      {:ok, %Serie{}}

      iex> create_serie(%{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def create_serie(attrs \\ %{}) do
    %Serie{}
    |> Serie.changeset(attrs)
    |> Repo.insert()
  end

  @doc """
  Updates a serie.

  ## Examples

      iex> update_serie(serie, %{field: new_value})
      {:ok, %Serie{}}

      iex> update_serie(serie, %{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def update_serie(%Serie{} = serie, attrs) do
    serie
    |> Serie.changeset(attrs)
    |> Repo.update()
  end

  @doc """
  Deletes a serie.

  ## Examples

      iex> delete_serie(serie)
      {:ok, %Serie{}}

      iex> delete_serie(serie)
      {:error, %Ecto.Changeset{}}

  """
  def delete_serie(%Serie{} = serie) do
    Repo.delete(serie)
  end

  @doc """
  Returns an `%Ecto.Changeset{}` for tracking serie changes.

  ## Examples

      iex> change_serie(serie)
      %Ecto.Changeset{data: %Serie{}}

  """
  def change_serie(%Serie{} = serie, attrs \\ %{}) do
    Serie.changeset(serie, attrs)
  end

  alias MangaDex.Publications.Author

  @doc """
  Returns the list of authors.

  ## Examples

      iex> list_authors()
      [%Author{}, ...]

  """
  def list_authors do
    Repo.all(Author)
  end

  @doc """
  Gets a single author.

  Raises `Ecto.NoResultsError` if the Author does not exist.

  ## Examples

      iex> get_author!(123)
      %Author{}

      iex> get_author!(456)
      ** (Ecto.NoResultsError)

  """
  def get_author!(id), do: Repo.get!(Author, id)

  @doc """
  Creates a author.

  ## Examples

      iex> create_author(%{field: value})
      {:ok, %Author{}}

      iex> create_author(%{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def create_author(attrs \\ %{}) do
    %Author{}
    |> Author.changeset(attrs)
    |> Repo.insert()
  end

  @doc """
  Updates a author.

  ## Examples

      iex> update_author(author, %{field: new_value})
      {:ok, %Author{}}

      iex> update_author(author, %{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def update_author(%Author{} = author, attrs) do
    author
    |> Author.changeset(attrs)
    |> Repo.update()
  end

  @doc """
  Deletes a author.

  ## Examples

      iex> delete_author(author)
      {:ok, %Author{}}

      iex> delete_author(author)
      {:error, %Ecto.Changeset{}}

  """
  def delete_author(%Author{} = author) do
    Repo.delete(author)
  end

  @doc """
  Returns an `%Ecto.Changeset{}` for tracking author changes.

  ## Examples

      iex> change_author(author)
      %Ecto.Changeset{data: %Author{}}

  """
  def change_author(%Author{} = author, attrs \\ %{}) do
    Author.changeset(author, attrs)
  end

  alias MangaDex.Publications.SerieAuthors

  @doc """
  Returns the list of serie_authors.

  ## Examples

      iex> list_serie_authors()
      [%SerieAuthors{}, ...]

  """
  def list_serie_authors do
    Repo.all(SerieAuthors)
  end

  @doc """
  Gets a single serie_authors.

  Raises `Ecto.NoResultsError` if the Serie authors does not exist.

  ## Examples

      iex> get_serie_authors!(123)
      %SerieAuthors{}

      iex> get_serie_authors!(456)
      ** (Ecto.NoResultsError)

  """
  def get_serie_authors!(id), do: Repo.get!(SerieAuthors, id)

  @doc """
  Creates a serie_authors.

  ## Examples

      iex> create_serie_authors(%{field: value})
      {:ok, %SerieAuthors{}}

      iex> create_serie_authors(%{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def create_serie_authors(attrs \\ %{}) do
    %SerieAuthors{}
    |> SerieAuthors.changeset(attrs)
    |> Repo.insert()
  end

  @doc """
  Updates a serie_authors.

  ## Examples

      iex> update_serie_authors(serie_authors, %{field: new_value})
      {:ok, %SerieAuthors{}}

      iex> update_serie_authors(serie_authors, %{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def update_serie_authors(%SerieAuthors{} = serie_authors, attrs) do
    serie_authors
    |> SerieAuthors.changeset(attrs)
    |> Repo.update()
  end

  @doc """
  Deletes a serie_authors.

  ## Examples

      iex> delete_serie_authors(serie_authors)
      {:ok, %SerieAuthors{}}

      iex> delete_serie_authors(serie_authors)
      {:error, %Ecto.Changeset{}}

  """
  def delete_serie_authors(%SerieAuthors{} = serie_authors) do
    Repo.delete(serie_authors)
  end

  @doc """
  Returns an `%Ecto.Changeset{}` for tracking serie_authors changes.

  ## Examples

      iex> change_serie_authors(serie_authors)
      %Ecto.Changeset{data: %SerieAuthors{}}

  """
  def change_serie_authors(%SerieAuthors{} = serie_authors, attrs \\ %{}) do
    SerieAuthors.changeset(serie_authors, attrs)
  end

  alias MangaDex.Publications.Volume

  @doc """
  Returns the list of volumes.

  ## Examples

      iex> list_volumes()
      [%Volume{}, ...]

  """
  def list_volumes do
    Repo.all(Volume)
  end

  @doc """
  Gets a single volume.

  Raises `Ecto.NoResultsError` if the Volume does not exist.

  ## Examples

      iex> get_volume!(123)
      %Volume{}

      iex> get_volume!(456)
      ** (Ecto.NoResultsError)

  """
  def get_volume!(id), do: Repo.get!(Volume, id)

  @doc """
  Creates a volume.

  ## Examples

      iex> create_volume(%{field: value})
      {:ok, %Volume{}}

      iex> create_volume(%{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def create_volume(attrs \\ %{}) do
    %Volume{}
    |> Volume.changeset(attrs)
    |> Repo.insert()
  end

  @doc """
  Updates a volume.

  ## Examples

      iex> update_volume(volume, %{field: new_value})
      {:ok, %Volume{}}

      iex> update_volume(volume, %{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def update_volume(%Volume{} = volume, attrs) do
    volume
    |> Volume.changeset(attrs)
    |> Repo.update()
  end

  @doc """
  Deletes a volume.

  ## Examples

      iex> delete_volume(volume)
      {:ok, %Volume{}}

      iex> delete_volume(volume)
      {:error, %Ecto.Changeset{}}

  """
  def delete_volume(%Volume{} = volume) do
    Repo.delete(volume)
  end

  @doc """
  Returns an `%Ecto.Changeset{}` for tracking volume changes.

  ## Examples

      iex> change_volume(volume)
      %Ecto.Changeset{data: %Volume{}}

  """
  def change_volume(%Volume{} = volume, attrs \\ %{}) do
    Volume.changeset(volume, attrs)
  end

  #Search
  def search_authors(search_term) do
    query =
      from(b in Author,
        where:
          fragment(
            "searchable @@ websearch_to_tsquery(?)",
            ^search_term
          ),
        order_by: {
          :desc,
          fragment(
            "ts_rank_cd(searchable, websearch_to_tsquery(?), 4)",
            ^search_term
          )
        }
      )

    Repo.all(query)
  end

  def search_series(search_term) do
    query =
      from(b in Serie,
        where:
          fragment(
            "searchable @@ websearch_to_tsquery(?)",
            ^search_term
          ),
        order_by: {
          :desc,
          fragment(
            "ts_rank_cd(searchable, websearch_to_tsquery(?), 4)",
            ^search_term
          )
        }
      )

    Repo.all(query)
  end
end
