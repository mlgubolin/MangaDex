defmodule MangaDex.Storage do
  @moduledoc """
  The Storage context.
  """

  import Ecto.Query, warn: false
  alias MangaDex.Repo

  alias MangaDex.Storage.Shelf

  @doc """
  Returns the list of shelves.

  ## Examples

      iex> list_shelves()
      [%Shelf{}, ...]

  """
  def list_shelves do
    Repo.all(Shelf)
  end

  @doc """
  Gets a single shelf.

  Raises `Ecto.NoResultsError` if the Shelf does not exist.

  ## Examples

      iex> get_shelf!(123)
      %Shelf{}

      iex> get_shelf!(456)
      ** (Ecto.NoResultsError)

  """
  def get_shelf!(id), do: Repo.get!(Shelf, id)

  @doc """
  Creates a shelf.

  ## Examples

      iex> create_shelf(%{field: value})
      {:ok, %Shelf{}}

      iex> create_shelf(%{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def create_shelf(attrs \\ %{}) do
    %Shelf{}
    |> Shelf.changeset(attrs)
    |> Repo.insert()
  end

  @doc """
  Updates a shelf.

  ## Examples

      iex> update_shelf(shelf, %{field: new_value})
      {:ok, %Shelf{}}

      iex> update_shelf(shelf, %{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def update_shelf(%Shelf{} = shelf, attrs) do
    shelf
    |> Shelf.changeset(attrs)
    |> Repo.update()
  end

  @doc """
  Deletes a shelf.

  ## Examples

      iex> delete_shelf(shelf)
      {:ok, %Shelf{}}

      iex> delete_shelf(shelf)
      {:error, %Ecto.Changeset{}}

  """
  def delete_shelf(%Shelf{} = shelf) do
    Repo.delete(shelf)
  end

  @doc """
  Returns an `%Ecto.Changeset{}` for tracking shelf changes.

  ## Examples

      iex> change_shelf(shelf)
      %Ecto.Changeset{data: %Shelf{}}

  """
  def change_shelf(%Shelf{} = shelf, attrs \\ %{}) do
    Shelf.changeset(shelf, attrs)
  end

  alias MangaDex.Storage.UserShelf

  @doc """
  Returns the list of user_shelves.

  ## Examples

      iex> list_user_shelves()
      [%UserShelf{}, ...]

  """
  def list_user_shelves do
    Repo.all(UserShelf)
  end

  @doc """
  Gets a single user_shelf.

  Raises `Ecto.NoResultsError` if the User shelf does not exist.

  ## Examples

      iex> get_user_shelf!(123)
      %UserShelf{}

      iex> get_user_shelf!(456)
      ** (Ecto.NoResultsError)

  """
  def get_user_shelf!(id), do: Repo.get!(UserShelf, id)

  @doc """
  Creates a user_shelf.

  ## Examples

      iex> create_user_shelf(%{field: value})
      {:ok, %UserShelf{}}

      iex> create_user_shelf(%{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def create_user_shelf(attrs \\ %{}) do
    %UserShelf{}
    |> UserShelf.changeset(attrs)
    |> Repo.insert()
  end

  @doc """
  Updates a user_shelf.

  ## Examples

      iex> update_user_shelf(user_shelf, %{field: new_value})
      {:ok, %UserShelf{}}

      iex> update_user_shelf(user_shelf, %{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def update_user_shelf(%UserShelf{} = user_shelf, attrs) do
    user_shelf
    |> UserShelf.changeset(attrs)
    |> Repo.update()
  end

  @doc """
  Deletes a user_shelf.

  ## Examples

      iex> delete_user_shelf(user_shelf)
      {:ok, %UserShelf{}}

      iex> delete_user_shelf(user_shelf)
      {:error, %Ecto.Changeset{}}

  """
  def delete_user_shelf(%UserShelf{} = user_shelf) do
    Repo.delete(user_shelf)
  end

  @doc """
  Returns an `%Ecto.Changeset{}` for tracking user_shelf changes.

  ## Examples

      iex> change_user_shelf(user_shelf)
      %Ecto.Changeset{data: %UserShelf{}}

  """
  def change_user_shelf(%UserShelf{} = user_shelf, attrs \\ %{}) do
    UserShelf.changeset(user_shelf, attrs)
  end

  alias MangaDex.Storage.ShelfVolumes

  @doc """
  Returns the list of shelf_volumes.

  ## Examples

      iex> list_shelf_volumes()
      [%ShelfVolumes{}, ...]

  """
  def list_shelf_volumes do
    Repo.all(ShelfVolumes)
  end

  @doc """
  Gets a single shelf_volumes.

  Raises `Ecto.NoResultsError` if the Shelf volumes does not exist.

  ## Examples

      iex> get_shelf_volumes!(123)
      %ShelfVolumes{}

      iex> get_shelf_volumes!(456)
      ** (Ecto.NoResultsError)

  """
  def get_shelf_volumes!(id), do: Repo.get!(ShelfVolumes, id)

  @doc """
  Creates a shelf_volumes.

  ## Examples

      iex> create_shelf_volumes(%{field: value})
      {:ok, %ShelfVolumes{}}

      iex> create_shelf_volumes(%{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def create_shelf_volumes(attrs \\ %{}) do
    %ShelfVolumes{}
    |> ShelfVolumes.changeset(attrs)
    |> Repo.insert()
  end

  @doc """
  Updates a shelf_volumes.

  ## Examples

      iex> update_shelf_volumes(shelf_volumes, %{field: new_value})
      {:ok, %ShelfVolumes{}}

      iex> update_shelf_volumes(shelf_volumes, %{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def update_shelf_volumes(%ShelfVolumes{} = shelf_volumes, attrs) do
    shelf_volumes
    |> ShelfVolumes.changeset(attrs)
    |> Repo.update()
  end

  @doc """
  Deletes a shelf_volumes.

  ## Examples

      iex> delete_shelf_volumes(shelf_volumes)
      {:ok, %ShelfVolumes{}}

      iex> delete_shelf_volumes(shelf_volumes)
      {:error, %Ecto.Changeset{}}

  """
  def delete_shelf_volumes(%ShelfVolumes{} = shelf_volumes) do
    Repo.delete(shelf_volumes)
  end

  @doc """
  Returns an `%Ecto.Changeset{}` for tracking shelf_volumes changes.

  ## Examples

      iex> change_shelf_volumes(shelf_volumes)
      %Ecto.Changeset{data: %ShelfVolumes{}}

  """
  def change_shelf_volumes(%ShelfVolumes{} = shelf_volumes, attrs \\ %{}) do
    ShelfVolumes.changeset(shelf_volumes, attrs)
  end
end
