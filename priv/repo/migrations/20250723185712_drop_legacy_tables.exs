defmodule OnboardingCm.Repo.Migrations.DropLegacyTables do
  use Ecto.Migration

  def change do
    # Drop index first
    drop_if_exists(index(:tag_product, [:tag_id, :product_id]))

    # Drop tables using SQL commands
    execute("DROP TABLE IF EXISTS collection CASCADE")
    execute("DROP TABLE IF EXISTS mix CASCADE")
    execute("DROP TABLE IF EXISTS product CASCADE")
    execute("DROP TABLE IF EXISTS tags CASCADE")
    execute("DROP TABLE IF EXISTS mix_product CASCADE")
    execute("DROP TABLE IF EXISTS tag_product CASCADE")
  end
end
