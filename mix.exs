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
      extra_applications: [:logger]
    ]
  end

  # Run "mix help deps" to learn about dependencies.
  defp deps do
    [
      {:excoveralls, "~> 0.10", only: :test},
    ]
  end
end
