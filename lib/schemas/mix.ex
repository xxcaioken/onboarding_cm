defmodule OnboardingCm.Schemas.Mix do
  use Ecto.Schema
  import Ecto.Changeset

  schema "mix" do
    field :name, :string

    timestamps()
  end

  def changeset(mix, attrs) do
    mix
    |> cast(attrs, [:name])
    |> validate_required([:name])
  end
end
