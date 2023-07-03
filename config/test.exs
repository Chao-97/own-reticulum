import Config

# We don't run a server during test. If one is required,
# you can enable the server option below.
config :ret, RetWeb.Endpoint,
  http: [port: 4001],
  allowed_origins: "*",
  # This config value is for local development only.
  secret_key_base: "txlMOtlaY5x3crvOCko4uV5PM29ul3zGo1oBGNO3cDXx+4GHLKqt0gR9qzgThxa5",
  cors_proxy_url: [scheme: "https", host: "hubs-proxy.local", port: 4000],
  server: false

# Print only warnings and errors during test
config :logger, level: :warn

config :ret, Ret.AppConfig, caching?: false

config :ret, Ret.Repo,
  adapter: Ecto.Adapters.Postgres,
  database: "ret_test",
  template: "template0",
  pool_size: 10,
  pool: Ecto.Adapters.SQL.Sandbox

config :ret, Ret.SessionLockRepo,
  adapter: Ecto.Adapters.Postgres,
  database: "ret_test",
  template: "template0",
  pool_size: 10,
  pool: Ecto.Adapters.SQL.Sandbox

config :ret, Ret.Locking, lock_timeout_ms: 1000 * 60 * 15

config :ret, Ret.Guardian,
  issuer: "ret",
  # This config value is for local development only.
  secret_key: "47iqPEdWcfE7xRnyaxKDLt9OGEtkQG3SycHBEMOuT2qARmoESnhc76IgCUjaQIwX"

config :ret, Ret.Storage,
  host: "https://localhost:4000",
  storage_path: "storage/test",
  ttl: 60 * 60 * 24

config :sentry,
  environment_name: :test,
  json_library: Poison,
  included_environments: [],
  tags: %{
    env: "test"
  }

config :ret, Ret.Repo.Migrations.AdminSchemaInit, postgrest_password: "password"
config :ret, Ret.Locking, lock_timeout_ms: 1000 * 60 * 15
config :ret, Ret.Account, admin_email: "admin@mozilla.com"

config :ret, RetWeb.HubChannel, enable_terminate_actions: false

config :ret, Ret.PermsToken, perms_key: "-----BEGIN RSA PRIVATE KEY-----\nMIICXAIBAAKBgQCt+VJDI3yfGUChntSDVBSeK8lFoWVtzBIQykfsx5zl/yVK8LkL\nftmUEq2436XHMoUXLfycZkGZnIlr9WdFDvfowOTCSu1KrfHkgdHQuHoo/nt13FfL\ngb5VJmNxX85v5Hl+Nc/g55To1HKPkwVnDdqZ3dOWI7w5UiAkLUrfFAuu/QIDAQAB\nAoGAL2nknoGcZCvYrnOADW6r09OxHfX3k63rOoI2ifR48UHRIxRqChT/LVjN2bWy\nE5DULtYMo39G35uG5FJUW8DRlTv8czubdMWpVmXeb9QwRQEzePZOdDcl+9Pr3xKd\n0tNLtusQ3NkXpWfi/Bn1r7+P3KcQG0/iRteguSaWdrUuS6ECQQD3/yzGXUfCFs+V\nlx9G3yVf8CBsjb8VAMoNgN3yz1I5De+pPWMNqEuMWfRobwcnxpOuO5L5a8Gd1D3U\nMf6oI9RpAkEAs5abSwyPFMKkrch+Lir0690LFKtEr+bLNat689eM/ddHpbrIWrZx\ndVM+ANa0cepl+Uo1Pp2YzOI2To2+L29jdQJAKf7iPC0rq6hlOrW+rCe5kod9ViSi\nyRG7JZI/A5EsIVFE1mn4ziVDtd69zrmOgqPT+ltIRkiDHxED710P/LUkkQJANNzB\nK28v8sF0rf7VPYvBemgfad8cIdcCu/KVB4/MXa/v1BXOAf2wGgP9vUt15A5GJAI2\n+A51uuFfcPICKH5WPQJBAJ1ZuK956dIpCb3SMTNYfLX600FWtsxaseu/Q6cxt+UN\nvpNwhHVPR06zaZHErq4FiWk2QlwnAc03yccRYSjT0E4=\n-----END RSA PRIVATE KEY-----"

config :ret, Ret.MediaResolver,
  giphy_api_key: nil,
  deviantart_client_id: nil,
  deviantart_client_secret: nil,
  imgur_mashape_api_key: nil,
  imgur_client_id: nil,
  youtube_api_key: nil,
  sketchfab_api_key: "7e1d3babf0e54ef59633c96235eb71ba",
  ytdl_host: nil,
  photomnemonic_endpoint: "https://uvnsm9nzhe.execute-api.us-west-1.amazonaws.com/public"

config :ret, :ex_unit_configuration, exclude: [dev_only: true]

config :ret, RetWeb.Plugs.RateLimit, throttle?: false
