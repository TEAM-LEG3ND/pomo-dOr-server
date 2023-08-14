defmodule Pomodor.AccountsFixtures do
  @moduledoc """
  This module defines test helpers for creating
  entities via the `Pomodor.Accounts` context.
  """

  @doc """
  Generate a user.
  """
  def user_fixture(attrs \\ %{}) do
    {:ok, user} =
      attrs
      |> Enum.into(%{
        universalId: "some universalId",
        nickname: "some nickname"
      })
      |> Pomodor.Accounts.create_user()

    user
  end
end
