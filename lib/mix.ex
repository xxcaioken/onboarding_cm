defmodule OnboardingCm.MixContext do
  alias OnboardingCm.Schemas.Mix, as: MixSchema

  def create(attrs \\ %{}) do
    %MixSchema{}
    |> MixSchema.changeset(attrs)
    |> OnboardingCm.Repo.insert()
  end

  def list_mixes do
    MixSchema
    |> OnboardingCm.Repo.all()
  end

  def get_mix!(id) do
    MixSchema
    |> OnboardingCm.Repo.get!(id)
  end

  def update_mix(%MixSchema{} = mix, attrs) do
    mix
    |> MixSchema.changeset(attrs)
    |> OnboardingCm.Repo.update()
  end

  def delete_mix(%MixSchema{} = mix) do
    OnboardingCm.Repo.delete(mix)
  end
end
