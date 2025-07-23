defmodule OnboardingCm.BLL.CollectionContext do
  alias OnboardingCm.Schemas.Collection, as: CollectionSchema

  def create(attrs \\ %{}) do
    %CollectionSchema{}
    |> CollectionSchema.changeset(attrs)
    |> OnboardingCm.Repo.insert()
  end

  def list_collections do
    CollectionSchema
    |> OnboardingCm.Repo.all()
  end

  def get_collection!(id) do
    CollectionSchema
    |> OnboardingCm.Repo.get_by(id: id)
  end

  def update_collection(%CollectionSchema{} = collection, attrs) do
    collection
    |> CollectionSchema.changeset(attrs)
    |> OnboardingCm.Repo.update()
  end

  def delete_collection(%CollectionSchema{} = collection) do
    OnboardingCm.Repo.delete(collection)
  end
end
