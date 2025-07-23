defmodule Onboarding_cm.Repo.Migrations.CreateProduct do
  use Ecto.Migration

  def change do
    create table(:product) do
      add :collection_id, references(:collection, on_delete: :delete_all)
      add :name, :string
      add :img_url, :string
      add :description, :text
      timestamps()
    end
  end
end
