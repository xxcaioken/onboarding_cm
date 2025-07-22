defmodule Onboarding_cm.Repo.Migrations.CreateTags do
  use Ecto.Migration

  create table(:tags) do
      add :name, :string

      timestamps()
    end
end
