defmodule OnboardingCm.BLL.MixProductContext do
  alias OnboardingCm.Schemas.MixProducts, as: MixProductSchema

  def create(attrs \\ %{}) do
    %MixProductSchema{}
    |> MixProductSchema.changeset(attrs)
    |> OnboardingCm.Repo.insert()
  end

  def list_mix_products do
    MixProductSchema
    |> OnboardingCm.Repo.all()
  end

  def update_mix_product(%MixProductSchema{} = mix_product, attrs) do
    mix_product
    |> MixProductSchema.changeset(attrs)
    |> OnboardingCm.Repo.update()
  end

  def delete_mix_product(%MixProductSchema{} = mix_product) do
    OnboardingCm.Repo.delete(mix_product)
  end

  def get_products_by_mix(mix_id) do
    %MixProductSchema{}
    |> OnboardingCm.Repo.get_by(mix_id: mix_id)
  end
end
