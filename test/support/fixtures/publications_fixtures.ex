defmodule MangaDex.PublicationsFixtures do
  @moduledoc """
  This module defines test helpers for creating
  entities via the `MangaDex.Publications` context.
  """

  @doc """
  Generate a serie.
  """
  def serie_fixture(attrs \\ %{}) do
    {:ok, serie} =
      attrs
      |> Enum.into(%{
        name: "some name"
      })
      |> MangaDex.Publications.create_serie()

    serie
  end

  @doc """
  Generate a author.
  """
  def author_fixture(attrs \\ %{}) do
    {:ok, author} =
      attrs
      |> Enum.into(%{
        name: "some name"
      })
      |> MangaDex.Publications.create_author()

    author
  end
end
