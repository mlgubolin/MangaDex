defmodule MangaDex.StorageTest do
  use MangaDex.DataCase

  alias MangaDex.Storage

  describe "shelves" do
    alias MangaDex.Storage.Shelf

    import MangaDex.StorageFixtures

    @invalid_attrs %{name: nil}

    test "list_shelves/0 returns all shelves" do
      shelf = shelf_fixture()
      assert Storage.list_shelves() == [shelf]
    end

    test "get_shelf!/1 returns the shelf with given id" do
      shelf = shelf_fixture()
      assert Storage.get_shelf!(shelf.id) == shelf
    end

    test "create_shelf/1 with valid data creates a shelf" do
      valid_attrs = %{name: "some name"}

      assert {:ok, %Shelf{} = shelf} = Storage.create_shelf(valid_attrs)
      assert shelf.name == "some name"
    end

    test "create_shelf/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Storage.create_shelf(@invalid_attrs)
    end

    test "update_shelf/2 with valid data updates the shelf" do
      shelf = shelf_fixture()
      update_attrs = %{name: "some updated name"}

      assert {:ok, %Shelf{} = shelf} = Storage.update_shelf(shelf, update_attrs)
      assert shelf.name == "some updated name"
    end

    test "update_shelf/2 with invalid data returns error changeset" do
      shelf = shelf_fixture()
      assert {:error, %Ecto.Changeset{}} = Storage.update_shelf(shelf, @invalid_attrs)
      assert shelf == Storage.get_shelf!(shelf.id)
    end

    test "delete_shelf/1 deletes the shelf" do
      shelf = shelf_fixture()
      assert {:ok, %Shelf{}} = Storage.delete_shelf(shelf)
      assert_raise Ecto.NoResultsError, fn -> Storage.get_shelf!(shelf.id) end
    end

    test "change_shelf/1 returns a shelf changeset" do
      shelf = shelf_fixture()
      assert %Ecto.Changeset{} = Storage.change_shelf(shelf)
    end
  end

  describe "user_shelves" do
    alias MangaDex.Storage.UserShelf

    import MangaDex.StorageFixtures

    @invalid_attrs %{permission: nil}

    test "list_user_shelves/0 returns all user_shelves" do
      user_shelf = user_shelf_fixture()
      assert Storage.list_user_shelves() == [user_shelf]
    end

    test "get_user_shelf!/1 returns the user_shelf with given id" do
      user_shelf = user_shelf_fixture()
      assert Storage.get_user_shelf!(user_shelf.id) == user_shelf
    end

    test "create_user_shelf/1 with valid data creates a user_shelf" do
      valid_attrs = %{permission: :admin}

      assert {:ok, %UserShelf{} = user_shelf} = Storage.create_user_shelf(valid_attrs)
      assert user_shelf.permission == :admin
    end

    test "create_user_shelf/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Storage.create_user_shelf(@invalid_attrs)
    end

    test "update_user_shelf/2 with valid data updates the user_shelf" do
      user_shelf = user_shelf_fixture()
      update_attrs = %{permission: :read}

      assert {:ok, %UserShelf{} = user_shelf} = Storage.update_user_shelf(user_shelf, update_attrs)
      assert user_shelf.permission == :read
    end

    test "update_user_shelf/2 with invalid data returns error changeset" do
      user_shelf = user_shelf_fixture()
      assert {:error, %Ecto.Changeset{}} = Storage.update_user_shelf(user_shelf, @invalid_attrs)
      assert user_shelf == Storage.get_user_shelf!(user_shelf.id)
    end

    test "delete_user_shelf/1 deletes the user_shelf" do
      user_shelf = user_shelf_fixture()
      assert {:ok, %UserShelf{}} = Storage.delete_user_shelf(user_shelf)
      assert_raise Ecto.NoResultsError, fn -> Storage.get_user_shelf!(user_shelf.id) end
    end

    test "change_user_shelf/1 returns a user_shelf changeset" do
      user_shelf = user_shelf_fixture()
      assert %Ecto.Changeset{} = Storage.change_user_shelf(user_shelf)
    end
  end

  describe "shelf_volumes" do
    alias MangaDex.Storage.ShelfVolumes

    import MangaDex.StorageFixtures

    @invalid_attrs %{amount: nil}

    test "list_shelf_volumes/0 returns all shelf_volumes" do
      shelf_volumes = shelf_volumes_fixture()
      assert Storage.list_shelf_volumes() == [shelf_volumes]
    end

    test "get_shelf_volumes!/1 returns the shelf_volumes with given id" do
      shelf_volumes = shelf_volumes_fixture()
      assert Storage.get_shelf_volumes!(shelf_volumes.id) == shelf_volumes
    end

    test "create_shelf_volumes/1 with valid data creates a shelf_volumes" do
      valid_attrs = %{amount: 42}

      assert {:ok, %ShelfVolumes{} = shelf_volumes} = Storage.create_shelf_volumes(valid_attrs)
      assert shelf_volumes.amount == 42
    end

    test "create_shelf_volumes/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Storage.create_shelf_volumes(@invalid_attrs)
    end

    test "update_shelf_volumes/2 with valid data updates the shelf_volumes" do
      shelf_volumes = shelf_volumes_fixture()
      update_attrs = %{amount: 43}

      assert {:ok, %ShelfVolumes{} = shelf_volumes} = Storage.update_shelf_volumes(shelf_volumes, update_attrs)
      assert shelf_volumes.amount == 43
    end

    test "update_shelf_volumes/2 with invalid data returns error changeset" do
      shelf_volumes = shelf_volumes_fixture()
      assert {:error, %Ecto.Changeset{}} = Storage.update_shelf_volumes(shelf_volumes, @invalid_attrs)
      assert shelf_volumes == Storage.get_shelf_volumes!(shelf_volumes.id)
    end

    test "delete_shelf_volumes/1 deletes the shelf_volumes" do
      shelf_volumes = shelf_volumes_fixture()
      assert {:ok, %ShelfVolumes{}} = Storage.delete_shelf_volumes(shelf_volumes)
      assert_raise Ecto.NoResultsError, fn -> Storage.get_shelf_volumes!(shelf_volumes.id) end
    end

    test "change_shelf_volumes/1 returns a shelf_volumes changeset" do
      shelf_volumes = shelf_volumes_fixture()
      assert %Ecto.Changeset{} = Storage.change_shelf_volumes(shelf_volumes)
    end
  end
end
