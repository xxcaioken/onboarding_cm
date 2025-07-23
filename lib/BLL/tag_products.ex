defmodule OnboardingCm.BLL.TagProductsContext do
  alias OnboardingCm.Schemas.TagProducts, as: TagProductSchema

  def create(attrs \\ %{}) do
    %TagProductSchema{}
    |> TagProductSchema.changeset(attrs)
    |> OnboardingCm.Repo.insert()
  end

  def list_tag_products do
    TagProductSchema
    |> OnboardingCm.Repo.all()
  end

  def update_tag_product(%TagProductSchema{} = tag_product, attrs) do
    tag_product
    |> TagProductSchema.changeset(attrs)
    |> OnboardingCm.Repo.update()
  end

  def delete_tag_product(%TagProductSchema{} = tag_product) do
    OnboardingCm.Repo.delete(tag_product)
  end

  def get_products_by_tag(tag_id) do
    TagProductSchema.get_products_by_tag(tag_id)
  end
end
