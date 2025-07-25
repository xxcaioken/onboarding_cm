defmodule OnboardingCm.Repo.Migrations.CreateProducts do
  use Ecto.Migration

  def change do
    create_if_not_exists table(:products) do
      add :name, :string, null: false
      add :description, :string
      add :collection_id, references(:collections, on_delete: :delete_all), null: false
      add :img_url, :string
      timestamps()
    end

    create index(:products, [:collection_id])
  end
end
