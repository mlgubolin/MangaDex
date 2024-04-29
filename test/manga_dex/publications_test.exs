defmodule MangaDex.PublicationsTest do
  use MangaDex.DataCase

  alias MangaDex.Publications

  describe "series" do
    alias MangaDex.Publications.Serie

    import MangaDex.PublicationsFixtures

    @invalid_attrs %{name: nil}

    test "list_series/0 returns all series" do
      serie = serie_fixture()
      assert Publications.list_series() == [serie]
    end

    test "get_serie!/1 returns the serie with given id" do
      serie = serie_fixture()
      assert Publications.get_serie!(serie.id) == serie
    end

    test "create_serie/1 with valid data creates a serie" do
      valid_attrs = %{name: "some name"}

      assert {:ok, %Serie{} = serie} = Publications.create_serie(valid_attrs)
      assert serie.name == "some name"
    end

    test "create_serie/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Publications.create_serie(@invalid_attrs)
    end

    test "update_serie/2 with valid data updates the serie" do
      serie = serie_fixture()
      update_attrs = %{name: "some updated name"}

      assert {:ok, %Serie{} = serie} = Publications.update_serie(serie, update_attrs)
      assert serie.name == "some updated name"
    end

    test "update_serie/2 with invalid data returns error changeset" do
      serie = serie_fixture()
      assert {:error, %Ecto.Changeset{}} = Publications.update_serie(serie, @invalid_attrs)
      assert serie == Publications.get_serie!(serie.id)
    end

    test "delete_serie/1 deletes the serie" do
      serie = serie_fixture()
      assert {:ok, %Serie{}} = Publications.delete_serie(serie)
      assert_raise Ecto.NoResultsError, fn -> Publications.get_serie!(serie.id) end
    end

    test "change_serie/1 returns a serie changeset" do
      serie = serie_fixture()
      assert %Ecto.Changeset{} = Publications.change_serie(serie)
    end
  end

  describe "authors" do
    alias MangaDex.Publications.Author

    import MangaDex.PublicationsFixtures

    @invalid_attrs %{name: nil}

    test "list_authors/0 returns all authors" do
      author = author_fixture()
      assert Publications.list_authors() == [author]
    end

    test "get_author!/1 returns the author with given id" do
      author = author_fixture()
      assert Publications.get_author!(author.id) == author
    end

    test "create_author/1 with valid data creates a author" do
      valid_attrs = %{name: "some name"}

      assert {:ok, %Author{} = author} = Publications.create_author(valid_attrs)
      assert author.name == "some name"
    end

    test "create_author/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Publications.create_author(@invalid_attrs)
    end

    test "update_author/2 with valid data updates the author" do
      author = author_fixture()
      update_attrs = %{name: "some updated name"}

      assert {:ok, %Author{} = author} = Publications.update_author(author, update_attrs)
      assert author.name == "some updated name"
    end

    test "update_author/2 with invalid data returns error changeset" do
      author = author_fixture()
      assert {:error, %Ecto.Changeset{}} = Publications.update_author(author, @invalid_attrs)
      assert author == Publications.get_author!(author.id)
    end

    test "delete_author/1 deletes the author" do
      author = author_fixture()
      assert {:ok, %Author{}} = Publications.delete_author(author)
      assert_raise Ecto.NoResultsError, fn -> Publications.get_author!(author.id) end
    end

    test "change_author/1 returns a author changeset" do
      author = author_fixture()
      assert %Ecto.Changeset{} = Publications.change_author(author)
    end
  end
end
