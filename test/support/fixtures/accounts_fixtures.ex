defmodule ConduitBackend.AccountsFixtures do
  @moduledoc """
  This module defines test helpers for creating
  entities via the `ConduitBackend.Accounts` context.
  """

  @doc """
  Generate a user.
  """
  import ConduitBackend.Factory

  alias ConduitBackend.Accounts

  def user_fixture(attrs \\ %{}) do
    build(:user, attrs) |> Accounts.create_user()
  end
end
