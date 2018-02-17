defmodule RavenxEmail.MixProject do
  use Mix.Project

  def project do
    [
      app: :ravenx_email,
      version: "0.1.0",
      elixir: "~> 1.6",
      start_permanent: Mix.env() == :prod,
      deps: deps()
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
      {:ex_doc, ">= 0.0.0", only: :dev},
      {:mock, "~> 0.3.0", only: :test},
      {:credo, "~> 0.8", only: [:dev, :test], runtime: false}
    ]
  end
end
