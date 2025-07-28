import Config

config :onboarding_cm, ecto_repos: [OnboardingCm.Repo]

config :onboarding_cm, OnboardingCm.Repo,
  database: "onboarding_cm_repo",
  username: "postgres",
  password: "postgres",
  hostname: "localhost"

if File.exists?("#{__DIR__}/#{Mix.env()}.exs") do
  import_config "#{Mix.env()}.exs"
end
