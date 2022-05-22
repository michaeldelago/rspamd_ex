defmodule RspamdEx.MixProject do
  use Mix.Project

  def project do
    [
      app: :rspamd_ex,
      version: "0.1.0",
      elixir: "~> 1.13",
      start_permanent: Mix.env() == :prod,
      deps: deps()
    ]
  end

  # Run "mix help compile.app" to learn about applications.
  def application do
    [
      mod: {RspamdEx.Application, []},
      extra_applications: [:logger, :crypto],
      env: [host: "localhost", port: 11334, delete: false, executable: "rspamd"],
      registered: [RspamdEx.Client]
    ]
  end

  # Run "mix help deps" to learn about dependencies.
  defp deps do
    [
      {:jason, "~> 1.2"}
    ]
  end
end
