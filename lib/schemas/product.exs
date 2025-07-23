defmodule OnboardingCm.Schemas.Product do
  use Ecto.Schema

  schema "products" do
    field :name, :string
    field :img_url, :string
    field :description, :text

    timestamps()
  end

  def changeset(product, attrs) do
    product
    |> cast(attrs, [:name, :img_url, :description])
    |> validate_required([:name, :img_url, :description])
  end

  def create(attrs \\ %{}) do
    %OnboardingCm.Schemas.Product{}
    |> changeset(attrs)
    |> OnboardingCm.Repo.insert()
  end

  def list_products do
    %OnboardingCm.Schemas.Product{}
    |> OnboardingCm.Repo.all()
  end

  def get_product!(id) do
    %OnboardingCm.Schemas.Product{}
    |> OnboardingCm.Repo.get!(id)
  end

  def get_products_by_collection(collection_id) do
    from(p in OnboardingCm.Schemas.Product, where: p.collection_id == ^collection_id)
    |> OnboardingCm.Repo.all()
  end

  def update_product(%OnboardingCm.Schemas.Product{} = product, attrs) do
    product
    |> changeset(attrs)
    |> OnboardingCm.Repo.update()
  end

  def delete_product(%OnboardingCm.Schemas.Product{} = product) do
    OnboardingCm.Repo.delete(product)
  end
end
