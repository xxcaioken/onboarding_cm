defmodule OnboardingCm.Repo.Migrations.CreateMixProducts do
  use Ecto.Migration

  def change do
    create table(:mix_products) do
      add :mix_id, references(:mix)
      add :product_map, :string

      timestamps()
    end
  end
end
