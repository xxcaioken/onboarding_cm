defmodule OnboardingCm.Repo.Migrations.CreateTagProducts do
  use Ecto.Migration

  def change do
    create_if_not_exists table(:tag_products) do
      add :tag_id, references(:tags, on_delete: :delete_all), null: false
      add :product_id, references(:products, on_delete: :delete_all), null: false

      timestamps()
    end

    create unique_index(:tag_products, [:tag_id, :product_id])
    create index(:tag_products, [:tag_id])
    create index(:tag_products, [:product_id])
  end
end
