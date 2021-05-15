defmodule PriceWatch.MixProject do
  use Mix.Project

  def project do
    [
      app: :price_watch,
      version: "0.1.0",
      elixir: "~> 1.11",
      start_permanent: Mix.env() == :prod,
      deps: deps()
    ]
  end

  # Run "mix help compile.app" to learn about applications.
  def application do
    [
      extra_applications: [:logger],
      mod: {PriceWatch.Application, []}
    ]
  end

  # Run "mix help deps" to learn about dependencies.
  defp deps do
    [
      {:crawly, "~> 0.13.0"},
      {:floki, "~> 0.26.0"},
      {:quantum, "~> 3.0"},
      {:bamboo, "~> 2.1.0"},
      {:bamboo_postmark, "~> 1.0"},
      {:jason, "~> 1.0"}
    ]
  end
end
