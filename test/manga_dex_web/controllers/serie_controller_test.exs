defmodule MangaDexWeb.SerieControllerTest do
  use MangaDexWeb.ConnCase

  import MangaDex.PublicationsFixtures

  @create_attrs %{name: "some name"}
  @update_attrs %{name: "some updated name"}
  @invalid_attrs %{name: nil}

  describe "index" do
    test "lists all series", %{conn: conn} do
      conn = get(conn, ~p"/series")
      assert html_response(conn, 200) =~ "Listing Series"
    end
  end

  describe "new serie" do
    test "renders form", %{conn: conn} do
      conn = get(conn, ~p"/series/new")
      assert html_response(conn, 200) =~ "New Serie"
    end
  end

  describe "create serie" do
    test "redirects to show when data is valid", %{conn: conn} do
      conn = post(conn, ~p"/series", serie: @create_attrs)

      assert %{id: id} = redirected_params(conn)
      assert redirected_to(conn) == ~p"/series/#{id}"

      conn = get(conn, ~p"/series/#{id}")
      assert html_response(conn, 200) =~ "Serie #{id}"
    end

    test "renders errors when data is invalid", %{conn: conn} do
      conn = post(conn, ~p"/series", serie: @invalid_attrs)
      assert html_response(conn, 200) =~ "New Serie"
    end
  end

  describe "edit serie" do
    setup [:create_serie]

    test "renders form for editing chosen serie", %{conn: conn, serie: serie} do
      conn = get(conn, ~p"/series/#{serie}/edit")
      assert html_response(conn, 200) =~ "Edit Serie"
    end
  end

  describe "update serie" do
    setup [:create_serie]

    test "redirects when data is valid", %{conn: conn, serie: serie} do
      conn = put(conn, ~p"/series/#{serie}", serie: @update_attrs)
      assert redirected_to(conn) == ~p"/series/#{serie}"

      conn = get(conn, ~p"/series/#{serie}")
      assert html_response(conn, 200) =~ "some updated name"
    end

    test "renders errors when data is invalid", %{conn: conn, serie: serie} do
      conn = put(conn, ~p"/series/#{serie}", serie: @invalid_attrs)
      assert html_response(conn, 200) =~ "Edit Serie"
    end
  end

  describe "delete serie" do
    setup [:create_serie]

    test "deletes chosen serie", %{conn: conn, serie: serie} do
      conn = delete(conn, ~p"/series/#{serie}")
      assert redirected_to(conn) == ~p"/series"

      assert_error_sent 404, fn ->
        get(conn, ~p"/series/#{serie}")
      end
    end
  end

  defp create_serie(_) do
    serie = serie_fixture()
    %{serie: serie}
  end
end
