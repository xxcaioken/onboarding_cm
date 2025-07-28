defmodule OnboardingCm.BLL.ProductContext do
  alias OnboardingCm.Schemas.Product, as: ProductSchema

  def create(attrs \\ %{}) do
    %ProductSchema{}
    |> ProductSchema.changeset(attrs)
    |> OnboardingCm.Repo.insert()
  end

  def create!(attrs \\ %{}) do
    %ProductSchema{}
    |> ProductSchema.changeset(attrs)
    |> OnboardingCm.Repo.insert!()
  end

  def list_products do
    ProductSchema
    |> OnboardingCm.Repo.all()
  end

  def get_product!(id) do
    ProductSchema
    |> OnboardingCm.Repo.get_by(id: id)
  end

  def update_product(%ProductSchema{} = product, attrs) do
    product
    |> ProductSchema.changeset(attrs)
    |> OnboardingCm.Repo.update()
  end

  def delete_product(%ProductSchema{} = product) do
    OnboardingCm.Repo.delete(product)
  end
end
