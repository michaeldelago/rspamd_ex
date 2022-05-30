import Config

config :rspamd_ex,
  host: "localhost",
  port: 11334,
  delete: true,
  password: "foo_password"

import_config "#{config_env()}.exs"
