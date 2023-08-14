defmodule Pomodor.Repo.Migrations.CreateUsers do
  use Ecto.Migration

  def change do
    create table(:users, primary_key: false) do
      add :id, :binary_id, primary_key: true
      add :universalId, :string
      add :nickname, :string

      timestamps()
    end
  end
end
