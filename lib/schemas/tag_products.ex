defmodule OnboardingCm.Schemas.TagProducts do
  use Ecto.Schema
  import Ecto.Changeset

  schema "tag_products" do
    field :tag_id, :integer
    field :product_id, :integer

    timestamps()
  end

  def changeset(tag_product, attrs) do
    tag_product
    |> cast(attrs, [:tag_id, :product_id])
    |> validate_required([:tag_id, :product_id])
  end

end
