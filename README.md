# RspamdEx

This is a small helper library for scanning emails with `rspamd`. It's useful in tandem with libraries such as [gen_smtp](https://github.com/gen-smtp/gen_smtp)

## Installation

Currently, the package is only available via git:

```elixir
def deps do
  [
    {:gettext, git: "https://github.com/michaeldelago/rspamd_ex.git", branch: "master"}`
  ]
end
```

## Configuration

```elixir
import Config

config :rspamd_ex,
  host: "localhost",
  port: 11334,
  delete: true,
  password: "PASSWORD_FOR_RSPAMD"
```

