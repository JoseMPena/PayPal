defmodule PayPal.Mixfile do
  use Mix.Project

  def project do
    [
      app: :pay_pal,
      version: "0.0.2",
      elixir: "~> 1.12",
      build_embedded: Application.get_env(:pay_pal, :environment) == :prod,
      start_permanent: Application.get_env(:pay_pal, :environment) == :prod,
      description: description(),
      package: package(),
      test_coverage: [tool: ExCoveralls],
      deps: deps(),
      docs: [extras: ["README.md"], main: "readme"],
      dialyzer: [plt_add_deps: :true]
    ]
  end

  def application do
    [
      extra_applications: [:logger, :httpoison],
      mod: {PayPal.Application, []}
    ]
  end

  defp deps do
    [
      {:httpoison, "~> 1.8"},
      {:poison, "~> 5.0"},
      {:oauth2, "~> 2.0"},
      {:exvcr, "~> 0.13", only: [:dev, :test]},
      {:ex_doc, "~> 0.25", only: [:dev, :docs]},
      {:excoveralls, "~> 0.14", only: [:dev, :test]},
      {:dialyxir, "~> 1.1", only: [:dev, :test], runtime: false}
    ]
  end

  defp description do
    """
    Elixir library for working with the PayPal REST API.
    """
  end

  defp package do
    [
      licenses: ["MIT"],
      keywords: ["Elixir", "PayPal", "REST", "Payments", "API"],
      maintainers: ["Zen Savona", "José M. Peña"],
      links: %{"GitHub" => "https://github.com/JoseMPena/paypal",
               "Docs" => "https://hexdocs.pm/paypal"}
    ]
  end
end
