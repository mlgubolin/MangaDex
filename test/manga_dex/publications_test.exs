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

  describe "serie_authors" do
    alias MangaDex.Publications.SerieAuthors

    import MangaDex.PublicationsFixtures

    @invalid_attrs %{}

    test "list_serie_authors/0 returns all serie_authors" do
      serie_authors = serie_authors_fixture()
      assert Publications.list_serie_authors() == [serie_authors]
    end

    test "get_serie_authors!/1 returns the serie_authors with given id" do
      serie_authors = serie_authors_fixture()
      assert Publications.get_serie_authors!(serie_authors.id) == serie_authors
    end

    test "create_serie_authors/1 with valid data creates a serie_authors" do
      valid_attrs = %{}

      assert {:ok, %SerieAuthors{} = serie_authors} = Publications.create_serie_authors(valid_attrs)
    end

    test "create_serie_authors/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Publications.create_serie_authors(@invalid_attrs)
    end

    test "update_serie_authors/2 with valid data updates the serie_authors" do
      serie_authors = serie_authors_fixture()
      update_attrs = %{}

      assert {:ok, %SerieAuthors{} = serie_authors} = Publications.update_serie_authors(serie_authors, update_attrs)
    end

    test "update_serie_authors/2 with invalid data returns error changeset" do
      serie_authors = serie_authors_fixture()
      assert {:error, %Ecto.Changeset{}} = Publications.update_serie_authors(serie_authors, @invalid_attrs)
      assert serie_authors == Publications.get_serie_authors!(serie_authors.id)
    end

    test "delete_serie_authors/1 deletes the serie_authors" do
      serie_authors = serie_authors_fixture()
      assert {:ok, %SerieAuthors{}} = Publications.delete_serie_authors(serie_authors)
      assert_raise Ecto.NoResultsError, fn -> Publications.get_serie_authors!(serie_authors.id) end
    end

    test "change_serie_authors/1 returns a serie_authors changeset" do
      serie_authors = serie_authors_fixture()
      assert %Ecto.Changeset{} = Publications.change_serie_authors(serie_authors)
    end
  end

  describe "volumes" do
    alias MangaDex.Publications.Volume

    import MangaDex.PublicationsFixtures

    @invalid_attrs %{number: nil}

    test "list_volumes/0 returns all volumes" do
      volume = volume_fixture()
      assert Publications.list_volumes() == [volume]
    end

    test "get_volume!/1 returns the volume with given id" do
      volume = volume_fixture()
      assert Publications.get_volume!(volume.id) == volume
    end

    test "create_volume/1 with valid data creates a volume" do
      valid_attrs = %{number: 42}

      assert {:ok, %Volume{} = volume} = Publications.create_volume(valid_attrs)
      assert volume.number == 42
    end

    test "create_volume/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Publications.create_volume(@invalid_attrs)
    end

    test "update_volume/2 with valid data updates the volume" do
      volume = volume_fixture()
      update_attrs = %{number: 43}

      assert {:ok, %Volume{} = volume} = Publications.update_volume(volume, update_attrs)
      assert volume.number == 43
    end

    test "update_volume/2 with invalid data returns error changeset" do
      volume = volume_fixture()
      assert {:error, %Ecto.Changeset{}} = Publications.update_volume(volume, @invalid_attrs)
      assert volume == Publications.get_volume!(volume.id)
    end

    test "delete_volume/1 deletes the volume" do
      volume = volume_fixture()
      assert {:ok, %Volume{}} = Publications.delete_volume(volume)
      assert_raise Ecto.NoResultsError, fn -> Publications.get_volume!(volume.id) end
    end

    test "change_volume/1 returns a volume changeset" do
      volume = volume_fixture()
      assert %Ecto.Changeset{} = Publications.change_volume(volume)
    end
  end
end
