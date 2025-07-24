defmodule OnboardingCm.Schemas.Tag do
  use Ecto.Schema
  import Ecto.Changeset

  schema "tags" do
    field :name, :string
    field :value, :string
    field :category, :string

    many_to_many :products, OnboardingCm.Schemas.Product,
      join_through: "tag_products",
      on_replace: :delete

    timestamps()
  end

  def changeset(tag, attrs) do
    tag
    |> cast(attrs, [:name, :value, :category])
    |> validate_required([:name, :value, :category])
    |> unique_constraint([:name, :value, :category])
  end
end
