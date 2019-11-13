defmodule BlitzBot.Repo do
  use Ecto.Repo,
    otp_app: :blitz_bot,
    adapter: Ecto.Adapters.Postgres
end
