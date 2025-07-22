defmodule OnboardingCm.MixProducts do
  use Ecto.Schema
  import Ecto.Changeset

  schema "mix_products" do
    field :mix_id, :integer
    field :product_id, :integer

    timestamps()
  end

  def changeset(mix_product, attrs) do
    mix_product
    |> cast(attrs, [:mix_id, :product_id])
    |> validate_required([:mix_id, :product_id])
  end

  def create(attrs \\ %{}) do
    %OnboardingCm.MixProducts{}
    |> changeset(attrs)
    |> OnboardingCm.Repo.insert()
  end

  def list_mix_products do
    %OnboardingCm.MixProducts{}
    |> OnboardingCm.Repo.all()
  end

  def update_mix_product(%OnboardingCm.MixProducts{} = mix_product, attrs) do
    mix_product
    |> changeset(attrs)
    |> OnboardingCm.Repo.update()
  end

  def delete_mix_product(%OnboardingCm.MixProducts{} = mix_product) do
    OnboardingCm.Repo.delete(mix_product)
  end

  def get_products_by_mix(mix_id) do
    from(p in OnboardingCm.Schemas.Product,
      join: mp in OnboardingCm.MixProducts, on: mp.product_id == p.id,
      where: mp.mix_id == ^mix_id,
      select: p
    )
    |> OnboardingCm.Repo.all()
  end
end
