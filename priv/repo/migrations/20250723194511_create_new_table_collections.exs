defmodule OnboardingCm.Repo.Migrations.CreateCollections do
  use Ecto.Migration

  def change do
    create table(:collections) do
      add :name, :string, null: false
      add :year, :integer, null: false
      add :season, :string, null: false
      add :estimated_delivery_date, :date, null: false

      timestamps()
    end

    create unique_index(:collections, [:name, :year, :season])
  end
end
