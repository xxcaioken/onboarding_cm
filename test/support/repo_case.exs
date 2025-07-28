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

  setup tags do
    pid = Ecto.Adapters.SQL.Sandbox.start_owner!(OnboardingCm.Repo, shared: not tags[:async])
    on_exit(fn -> Ecto.Adapters.SQL.Sandbox.stop_owner(pid) end)
    :ok# = Ecto.Adapters.SQL.Sandbox.checkout(OnboardingCm.Repo)
  end

end
