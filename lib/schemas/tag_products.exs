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

  def create(attrs \\ %{}) do
    %OnboardingCm.TagProducts{}
    |> changeset(attrs)
    |> OnboardingCm.Repo.insert()
  end

  def list_tag_products do
    %OnboardingCm.TagProducts{}
    |> OnboardingCm.Repo.all()
  end

  def update_tag_product(%OnboardingCm.TagProducts{} = tag_product, attrs) do
    tag_product
    |> changeset(attrs)
    |> OnboardingCm.Repo.update()
  end

  def delete_tag_product(%OnboardingCm.TagProducts{} = tag_product) do
    OnboardingCm.Repo.delete(tag_product)
  end

  def get_products_by_tag_and_collection(tag_id, collection_id) do
    from(p in OnboardingCm.Product,
      join: tp in OnboardingCm.TagProducts, on: tp.product_id == p.id,
      where: p.collection_id == ^collection_id,
      select: p
    )
    |> OnboardingCm.Repo.all()
  end
end
