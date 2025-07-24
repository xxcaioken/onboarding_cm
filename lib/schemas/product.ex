defmodule OnboardingCm.Schemas.Product do
  use Ecto.Schema
  import Ecto.Changeset

  schema "products" do
    field :name, :string
    field :img_url, :string
    field :description, :string

    belongs_to :collection, OnboardingCm.Schemas.Collection

    many_to_many :tags, OnboardingCm.Schemas.Tag,
      join_through: "tag_products",
      on_replace: :delete

    timestamps()
  end

  def changeset(product, attrs) do
    product
    |> cast(attrs, [:name, :description, :img_url, :collection_id])
    |> validate_required([:name, :description, :img_url, :collection_id])
    |> foreign_key_constraint(:collection_id)
  end
end
