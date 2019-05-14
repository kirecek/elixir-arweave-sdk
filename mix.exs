defmodule Arweave.MixProject do
  use Mix.Project

  def project do
    [
      app: :arweave,
      version: "0.1.0",
      elixir: "~> 1.8",
      start_permanent: Mix.env() == :prod,
      deps: deps(),
      preferred_cli_env: [coveralls: :test, "coveralls.detail": :test, "coveralls.post": :test],
      test_coverage: [tool: ExCoveralls],
    ]
  end

  # Run "mix help compile.app" to learn about applications.
  def application do
    [
      applications: [:httpoison, :exjsx],
      extra_applications: [:logger],
    ]
  end

  # Run "mix help deps" to learn about dependencies.
  defp deps do
    [
      {:exjsx, "~> 4.0.0"},
      {:httpoison, "~> 1.5.1"},
      {:excoveralls, "~> 0.10", only: :test},
      {:meck, "~> 0.8.9", only: :test},
    ]
  end
end
