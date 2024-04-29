defmodule MangaDex.StorageFixtures do
  @moduledoc """
  This module defines test helpers for creating
  entities via the `MangaDex.Storage` context.
  """

  @doc """
  Generate a shelf.
  """
  def shelf_fixture(attrs \\ %{}) do
    {:ok, shelf} =
      attrs
      |> Enum.into(%{
        name: "some name"
      })
      |> MangaDex.Storage.create_shelf()

    shelf
  end

  @doc """
  Generate a user_shelf.
  """
  def user_shelf_fixture(attrs \\ %{}) do
    {:ok, user_shelf} =
      attrs
      |> Enum.into(%{
        permission: :admin
      })
      |> MangaDex.Storage.create_user_shelf()

    user_shelf
  end

  @doc """
  Generate a shelf_volumes.
  """
  def shelf_volumes_fixture(attrs \\ %{}) do
    {:ok, shelf_volumes} =
      attrs
      |> Enum.into(%{
        amount: 42
      })
      |> MangaDex.Storage.create_shelf_volumes()

    shelf_volumes
  end
end
