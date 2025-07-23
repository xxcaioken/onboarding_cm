defmodule OnboardingCm.Schemas.MixProducts do
  use Ecto.Schema
  import Ecto.Changeset

  schema "mix_products" do
    field :mix_id, :integer
    field :product_map, :integer

    timestamps()
  end

  def changeset(mix_product, attrs) do
    mix_product
    |> cast(attrs, [:mix_id, :product_map])
    |> validate_required([:mix_id, :product_map])
  end
end
