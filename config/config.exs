import Config

config :onboarding_cm, Onboarding_cm.Repo,
  database: "onboarding_cm_repo",
  username: "postgres",
  password: "postgres",
  hostname: "localhost"

config :onboarding_cm, ecto_repos: [Onboarding_cm.Repo]
