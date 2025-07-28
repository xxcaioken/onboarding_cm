defmodule OnboardingCm.RepoCase do
  use ExUnit.CaseTemplate

  using do
    quote do
      alias OnboardingCm.Repo

      import Ecto
      import Ecto.Query
      import OnboardingCm.RepoCase
    end
  end


end
