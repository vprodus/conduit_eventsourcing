defmodule ConduitBackend.AccountsFixtures do
  @moduledoc """
  This module defines test helpers for creating
  entities via the `ConduitBackend.Accounts` context.
  """

  @doc """
  Generate a user.
  """
  def user_fixture(attrs \\ %{}) do
    {:ok, user} =
      attrs
      |> Enum.into(%{
        image: "some image",
        username: "some username",
        email: "some email",
        hashed_password: "some hashed_password",
        bio: "some bio"
      })
      |> ConduitBackend.Accounts.create_user()

    user
  end
end
