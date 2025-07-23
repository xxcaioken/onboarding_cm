defmodule OnboardingCm.Schemas.Collection do
  use Ecto.Schema
  import Ecto.Changeset

  schema "collection" do
    field :name, :string
    field :collection_year, :string
    field :collection_season, :string
    field :release_date, :date

    timestamps()
  end

  def changeset(collection, attrs) do
    collection
    |> cast(attrs, [:name, :collection_year, :collection_season, :release_date])
    |> validate_required([:name, :collection_year, :collection_season, :release_date])
  end
end
