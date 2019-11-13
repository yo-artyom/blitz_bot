defmodule BlitzBot.Mixfile do
  use Mix.Project

  def project do
    [
      app: :blitz_bot,
      version: "0.1.0",
      elixir: "~> 1.9",
      start_permanent: Mix.env == :prod,
      escript: escript(),
      deps: deps()
    ]
  end

  # Run "mix help compile.app" to learn about applications.
  def application do
    [
      extra_applications: [:logger]
    ]
  end

  def escript do
    [
      main_module: BlitzBot,
    ]
  end

  # Run "mix help deps" to learn about dependencies.
  defp deps do
    [
      {:nadia,  "~> 0.4.2" },
      {:postgrex, ">= 0.0.0"},
      {:ecto_sql, "~> 3.1.4"},
      {:poison, "~> 3.1"}
    ]
  end
end
