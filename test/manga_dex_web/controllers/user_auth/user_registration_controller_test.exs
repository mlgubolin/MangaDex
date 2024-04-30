defmodule MangaDexWeb.UserAuth.UserRegistrationControllerTest do
  use MangaDexWeb.ConnCase, async: true

  import MangaDex.AccountsFixtures

  describe "GET /user_auth/users/register" do
    test "renders registration page", %{conn: conn} do
      conn = get(conn, ~p"/user_auth/users/register")
      response = html_response(conn, 200)
      assert response =~ "Register"
      assert response =~ ~p"/user_auth/users/log_in"
      assert response =~ ~p"/user_auth/users/register"
    end

    test "redirects if already logged in", %{conn: conn} do
      conn = conn |> log_in_user(user_fixture()) |> get(~p"/user_auth/users/register")

      assert redirected_to(conn) == ~p"/"
    end
  end

  describe "POST /user_auth/users/register" do
    @tag :capture_log
    test "creates account and logs the user in", %{conn: conn} do
      email = unique_user_email()

      conn =
        post(conn, ~p"/user_auth/users/register", %{
          "user" => valid_user_attributes(email: email)
        })

      assert get_session(conn, :user_token)
      assert redirected_to(conn) == ~p"/"

      # Now do a logged in request and assert on the menu
      conn = get(conn, ~p"/")
      response = html_response(conn, 200)
      assert response =~ email
      assert response =~ ~p"/user_auth/users/settings"
      assert response =~ ~p"/user_auth/users/log_out"
    end

    test "render errors for invalid data", %{conn: conn} do
      conn =
        post(conn, ~p"/user_auth/users/register", %{
          "user" => %{"email" => "with spaces", "password" => "too short"}
        })

      response = html_response(conn, 200)
      assert response =~ "Register"
      assert response =~ "must have the @ sign and no spaces"
      assert response =~ "should be at least 12 character"
    end
  end
end
