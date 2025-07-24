defmodule OnboardingCm.Schemas.TagProducts do
  use Ecto.Schema
  import Ecto.Changeset

  schema "tag_products" do
    belongs_to :tag, OnboardingCm.Schemas.Tag
    belongs_to :product, OnboardingCm.Schemas.Product

    timestamps()
  end

  def changeset(tag_product, attrs) do
    tag_product
    |> cast(attrs, [:tag_id, :product_id])
    |> validate_required([:tag_id, :product_id])
    |> unique_constraint([:tag_id, :product_id])
    |> foreign_key_constraint(:tag_id)
    |> foreign_key_constraint(:product_id)
  end
end
