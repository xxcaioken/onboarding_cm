defmodule OnboardingCm.Schemas.Product do
  use Ecto.Schema
  import Ecto.Changeset

  schema "product" do
    field :collection_id, :integer
    field :name, :string
    field :img_url, :string
    field :description, :string

    timestamps()
  end

  def changeset(product, attrs) do
    product
    |> cast(attrs, [:collection_id, :name, :img_url, :description])
    |> validate_required([:name, :img_url, :description])
  end
end
