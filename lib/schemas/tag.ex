defmodule OnboardingCm.Schemas.Tag do
  use Ecto.Schema
  import Ecto.Changeset

  schema "tags" do
    field :name, :string
    field :value, :string
    field :description, :string

    many_to_many :products, OnboardingCm.Schemas.Product,
      join_through: "tag_products",
      on_replace: :delete

    timestamps()
  end

  def changeset(tag, attrs) do
    tag
    |> cast(attrs, [:name, :value, :description])
    |> validate_required([:name, :value])
    |> unique_constraint([:name, :value, :description])
  end
end
