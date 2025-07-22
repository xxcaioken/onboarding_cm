defmodule OnboardingCm.Collection do
  use Ecto.Schema
  import Ecto.Changeset
  import Ecto.Query

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

  def create(attrs \\ %{}) do
    %OnboardingCm.Collection{}
    |> changeset(attrs)
    |> OnboardingCm.Repo.insert()
  end

  def list_collections do
    %OnboardingCm.Collection{}
    |> OnboardingCm.Repo.all()
  end

  def get_collection!(id) do
    %OnboardingCm.Collection{}
    |> OnboardingCm.Repo.get!(id)
  end

  def update_collection(%OnboardingCm.Collection{} = collection, attrs) do
    collection
    |> changeset(attrs)
    |> OnboardingCm.Repo.update()
  end

  def delete_collection(%OnboardingCm.Collection{} = collection) do
    OnboardingCm.Repo.delete(collection)
  end
end
