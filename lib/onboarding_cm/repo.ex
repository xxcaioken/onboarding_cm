defmodule Onboarding_cm.Repo do
  use Ecto.Repo,
    otp_app: :onboarding_cm,
    adapter: Ecto.Adapters.Postgres
end
