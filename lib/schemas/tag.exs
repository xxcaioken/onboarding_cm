defmodule OnboardingCm.Schemas.Tag do
  use Ecto.Schema

  schema "tags" do
    field :name, :string

    timestamps()
  end

  def changeset(tag, attrs) do
    tag
    |> cast(attrs, [:name])
    |> validate_required([:name])
  end

  def create(attrs \\ %{}) do
    %OnboardingCm.Schemas.Tag{}
    |> changeset(attrs)
    |> OnboardingCm.Repo.insert()
  end

  def list_tags do
    %OnboardingCm.Schemas.Tag{}
    |> OnboardingCm.Repo.all()
  end

  def update_tag(%OnboardingCm.Schemas.Tag{} = tag, attrs) do
    tag
    |> changeset(attrs)
    |> OnboardingCm.Repo.update()
  end

  def delete_tag(%OnboardingCm.Schemas.Tag{} = tag) do
    OnboardingCm.Repo.delete(tag)
  end
end
