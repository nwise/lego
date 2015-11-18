defmodule Lego.Mixfile do
  use Mix.Project

  def project do
    [app: :lego,
     version: "0.0.1",
     elixir: "~> 1.1",
     elixirc_paths: elixirc_paths(Mix.env),
     build_embedded: Mix.env == :prod,
     start_permanent: Mix.env == :prod,
     escript: escript_config,
     deps: deps]
  end

  # Configuration for the OTP application
  #
  # Type "mix help compile.app" for more information
  def application do
    [applications: [:logger, :postgrex, :ecto]]
  end

  defp elixirc_paths(_), do: ["lib", "lib/models"]

  # Dependencies can be Hex packages:
  #
  #   {:mydep, "~> 0.3.0"}
  #
  # Or git/path repositories:
  #
  #   {:mydep, git: "https://github.com/elixir-lang/mydep.git", tag: "0.1.0"}
  #
  # Type "mix help deps" for more examples and options
  defp deps do
    [{:postgrex, ">= 0.0.0"},
     {:ecto, "~> 1.0"}]
  end

  defp escript_config do
    [ main_module: Lego.CLI ]
  end
end
