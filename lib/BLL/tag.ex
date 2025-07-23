defmodule OnboardingCm.BLL.TagContext do
  alias OnboardingCm.Schemas.Tag, as: TagSchema

  def create(attrs \\ %{}) do
    %TagSchema{}
    |> TagSchema.changeset(attrs)
    |> OnboardingCm.Repo.insert()
  end

  def list_tags do
    TagSchema
    |> OnboardingCm.Repo.all()
  end

  def get_tag!(id) do
    TagSchema
    |> OnboardingCm.Repo.get!(id)
  end

  def update_tag(%TagSchema{} = tag, attrs) do
    tag
    |> TagSchema.changeset(attrs)
    |> OnboardingCm.Repo.update()
  end

  def delete_tag(%TagSchema{} = tag) do
    OnboardingCm.Repo.delete(tag)
  end
end
