defmodule OnboardingCm.Repo.Migrations.CreateTags do
  use Ecto.Migration

  def change do
    create_if_not_exists table(:tags) do
      add :name, :string, null: false
      add :value, :string, null: false
      add :description, :string, null: false

      timestamps()
    end

    create unique_index(:tags, [:name, :value, :description])
  end
end
