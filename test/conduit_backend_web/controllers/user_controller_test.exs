defmodule ConduitBackendWeb.UserControllerTest do
  use ConduitBackendWeb.ConnCase

  alias Conduit.Accounts
  import ConduitBackend.Factory

  def fixture(attrs \\ %{}) do
    build(:user, attrs) |> Accounts.create_user()
  end

  setup %{conn: conn} do
    {:ok, conn: put_req_header(conn, "accept", "application/json")}
  end

  describe "register user" do
    test "should create and return user when data is valid", %{conn: conn} do
      conn = post(conn, ~p"/api/users/", user: build(:user))
      json = json_response(conn, 201)["user"]


      assert json == %{
        "bio" => nil,
        "email" => "jake@jake.jake",
        "image" => nil,
        "username" => "jake",
      }
    end

    test "should not create user and render errors when data is invalid", %{conn: conn} do
      conn = post(conn, ~p"/api/users/", user: build(:user, username: ""))
      assert json_response(conn, 422)["errors"] != %{
        "username" => [
          "can't be empty",
        ]
      }
    end

    test "should not create user and render errors when username has been taken", %{conn: conn} do
      # register a user
      {:ok, _user} = fixture()

      # attempt to register the same username
      conn = post conn, ~p"/api/users/", user: build(:user, email: "jake2@jake.jake")
      assert json_response(conn, 422)["errors"] == %{
        "username" => [
          "has already been taken",
        ]
      }
    end
  end
end
