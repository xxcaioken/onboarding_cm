defmodule OnboardingCm.Repo.Migrations.CreateTagProduct do
  use Ecto.Migration

  def change do
    create table(:tag_product) do
      add :tag_id, references(:tags)
      add :product_id, references(:product)

      timestamps()
    end

    create unique_index(:tag_product, [:tag_id, :product_id])
  end
end
