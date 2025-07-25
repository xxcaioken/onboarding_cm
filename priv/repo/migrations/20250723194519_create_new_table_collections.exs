defmodule OnboardingCm.Repo.Migrations.CreateNewTableCollections do
  use Ecto.Migration

  def change do
    create_if_not_exists table(:collections) do
      add :name, :string
      add :year, :string
      add :season, :string
      add :release_date, :date

      timestamps()
    end

    create_if_not_exists unique_index(:collections, [:name, :year, :season])
  end
end
