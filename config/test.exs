import Config

config :onboarding_cm, OnboardingCm.Repo,
  database: "onboarding_cm_repo_test",
  username: "postgres",
  password: "postgres",
  hostname: "localhost",
  pool: Ecto.Adapters.SQL.Sandbox
