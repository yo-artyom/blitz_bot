use Mix.Config


config :nadia, token: System.get_env("BOT_TOKEN")

config :blitz_bot, BlitzBot.Repo,
  database: "blitz_bot_repo",
  hostname: "localhost"

config :blitz_bot, ecto_repos: [BlitzBot.Repo]
