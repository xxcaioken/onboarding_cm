defmodule OnboardingCm.Schemas.Collection do
  use Ecto.Schema
  import Ecto.Changeset

  schema "collections" do
    field :name, :string
    field :year, :integer
    field :season, :string
    field :release_date, :date

    has_many :products, OnboardingCm.Schemas.Product

    timestamps()
  end

  def changeset(collection, attrs) do
    collection
    |> cast(attrs, [:name, :year, :season, :release_date])
    |> validate_required([:name, :year, :season, :release_date])
    |> unique_constraint([:name, :year, :season])
  end
end
