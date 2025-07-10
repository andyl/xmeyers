defmodule Xmeyers.MixProject do
  use Mix.Project

  def project do
    [
      app: :xmeyers,
      version: "0.1.0",
      elixir: "~> 1.17",
      start_permanent: Mix.env() == :prod,
      compilers: Mix.compilers(),
      aliases: aliases(),
      deps: deps()
    ]
  end

  def application do
    [
      extra_applications: [:logger]
    ]
  end

  defp deps do
    [
      {:tableau, "~> 0.25"},
      {:tailwind, "~> 0.3", runtime: Mix.env() == :dev},
      {:phoenix_live_view, "~> 1.0"}
    ]
  end

  defp aliases do
    [
      build: ["tableau.build", "tailwind default --minify", "deploy"],
      serve: ["tableau.server"]
    ]
  end
end
