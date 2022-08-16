import Config

config :rspamd_ex,
  host: "localhost",
  port: 11334,
  delete: true,
  password: "foo_password",
  scan_timeout_seconds: 30000

import_config "#{config_env()}.exs"
