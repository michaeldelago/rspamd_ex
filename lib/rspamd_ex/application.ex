defmodule RspamdEx.Application do
  use Application

  def start(_type, _args) do
    children = [
      RspamdEx.Client
    ]

    File.mkdir_p(Application.fetch_env!(:rspamd_ex, :path))
    Supervisor.start_link(children, strategy: :one_for_one, name: __MODULE__)
  end
end
