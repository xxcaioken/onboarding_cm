defmodule OnboardingCm.Mix do
  use Ecto.Schema
  import Ecto.Changeset
  import Ecto.Query

  schema "mix" do
    field :name, :string

    timestamps()
  end

  def changeset(mix, attrs) do
    mix
    |> cast(attrs, [:name])
    |> validate_required([:name])
  end

  def create(attrs \\ %{}) do
    %OnboardingCm.Mix{}
    |> changeset(attrs)
    |> OnboardingCm.Repo.insert()
  end

  def list_mixes do
    %OnboardingCm.Mix{}
    |> OnboardingCm.Repo.all()
  end

  def get_mix!(id) do
    %OnboardingCm.Mix{}
    |> OnboardingCm.Repo.get!(id)
  end

  def update_mix(%OnboardingCm.Mix{} = mix, attrs) do
    mix
    |> changeset(attrs)
    |> OnboardingCm.Repo.update()
  end

  def delete_mix(%OnboardingCm.Mix{} = mix) do
    OnboardingCm.Repo.delete(mix)
  end
end
