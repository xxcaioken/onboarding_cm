defmodule OnboardingCm.Repo.Migrations.CreateNewTableCollections do
  use Ecto.Migration

  def change do
    create(table(:collections)) do
      add :name, :string
      add :year, :integer
      add :season, :string
      add :release_date, :date

      timestamps()
    end

    create(unique_index(:collections, [:name, :year, :season]))
  end
end
