import Config

config :onboarding_cm, OnboardingCm.Repo,
  database: "onboarding_cm_repo",
  username: "postgres",
  password: "postgres",
  hostname: "localhost",
  pool: Ecto.Adapters.SQL.Sandbox
