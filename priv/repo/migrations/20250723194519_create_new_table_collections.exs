defmodule OnboardingCm.Repo.Migrations.CreateNewTableCollections do
  use Ecto.Migration

  def change do
    create table(:collections) do
      add :name, :string
      add :collection_year, :string
      add :collection_season, :string
      add :release_date, :date

      timestamps()
    end

    create unique_index(:collections, [:name, :collection_year, :collection_season])
  end
end
