defmodule RavenxEmail.MixProject do
  use Mix.Project

  def project do
    [
      app: :ravenx_email,
      version: "0.1.0",
      elixir: "~> 1.4",
      build_embedded: Mix.env() == :prod,
      start_permanent: Mix.env() == :prod,
      description: description(),
      package: package(),
      deps: deps(),
      docs: docs()
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
      {:ravenx, "~> 1.1 or ~> 2.0"},
      {:bamboo, "~> 0.8 or ~> 1.0"},
      {:bamboo_smtp, "~> 1.4 or ~> 1.5"},
      {:ex_doc, ">= 0.0.0", only: :dev},
      {:mock, "~> 0.3.0", only: :test},
      {:credo, "~> 0.8", only: [:dev, :test], runtime: false}
    ]
  end

  defp docs do
    [
      main: "readme",
      source_url: "https://github.com/acutario/ravenx_email",
      extras: ["README.md"]
    ]
  end

  defp description do
    """
    Ravenx strategy to send notifications using e-mail.
    """
  end

  defp package do
    # These are the default files included in the package
    [
      name: :ravenx_email,
      files: ["lib", "mix.exs", "README*", "LICENSE*"],
      maintainers: ["Óscar de Arriba"],
      licenses: ["MIT"],
      links: %{"GitHub" => "https://github.com/acutario/ravenx_email"}
    ]
  end
end
