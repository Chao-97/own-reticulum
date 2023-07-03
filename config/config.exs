import Config

# General application configuration

config :ret,
  ecto_repos: [Ret.Repo, Ret.SessionLockRepo]

config :phoenix, :format_encoders, "json-api": Jason
config :phoenix, :json_library, Jason

config :canary,
  repo: Ret.Repo,
  unauthorized_handler: {RetWeb.Canary.AuthorizationErrorHandler, :authorization_error}

config :mime, :types, %{
  "application/vnd.api+json" => ["json-api"],
  "model/gltf+json" => ["gltf"],
  "model/gltf-binary" => ["glb"],
  "application/vnd.spoke.scene" => ["spoke"],
  "application/vnd.pgrst.object+json" => ["json"],
  "application/json" => ["json"],
  "application/wasm" => ["wasm"]
}

config :ret, Ret.AppConfig, caching?: true

# Configures the endpoint
config :ret, RetWeb.Endpoint,
  url: [host: "localhost"],
  # This config value is for local development only.
  secret_key_base: "txlMOtlaY5x3crvOCko4uV5PM29ul3zGo1oBGNO3cDXx+7GHLKqt0gR9qzgThxb5",
  render_errors: [view: RetWeb.ErrorView, accepts: ~w(html json)],
  pubsub_server: Ret.PubSub

# Configures Elixir's Logger
config :logger, :console,
  format: "$time $metadata[$level] $message\n",
  metadata: [:request_id]

config :ret, Ret.Repo,
  migration_source: "schema_migrations",
  migration_default_prefix: "ret0",
  after_connect: {Ret.Repo, :set_search_path, ["public, ret0"]},
  # Downloads from Sketchfab to file cache hold connections open
  ownership_timeout: 60_000,
  timeout: 60_000

config :ret, Ret.SessionLockRepo,
  migration_source: "schema_migrations",
  migration_default_prefix: "ret0",
  after_connect: {Ret.SessionLockRepo, :set_search_path, ["public, ret0"]},
  # Downloads from Sketchfab to file cache hold connections open
  ownership_timeout: 60_000,
  timeout: 60_000

config :ret, RetWeb.Plugs.RateLimit, throttle?: true

config :ret, RetWeb.Router, secure?: false

config :peerage, log_results: false

config :statix, prefix: "ret"

config :ret, Ret.PermsToken, perms_key: "-----BEGIN RSA PRIVATE KEY-----\nMIICXAIBAAKBgQCt+VJDI3yfGUChntSDVBSeK8lFoWVtzBIQykfsx5zl/yVK8LkL\nftmUEq2436XHMoUXLfycZkGZnIlr9WdFDvfowOTCSu1KrfHkgdHQuHoo/nt13FfL\ngb5VJmNxX85v5Hl+Nc/g55To1HKPkwVnDdqZ3dOWI7w5UiAkLUrfFAuu/QIDAQAB\nAoGAL2nknoGcZCvYrnOADW6r09OxHfX3k63rOoI2ifR48UHRIxRqChT/LVjN2bWy\nE5DULtYMo39G35uG5FJUW8DRlTv8czubdMWpVmXeb9QwRQEzePZOdDcl+9Pr3xKd\n0tNLtusQ3NkXpWfi/Bn1r7+P3KcQG0/iRteguSaWdrUuS6ECQQD3/yzGXUfCFs+V\nlx9G3yVf8CBsjb8VAMoNgN3yz1I5De+pPWMNqEuMWfRobwcnxpOuO5L5a8Gd1D3U\nMf6oI9RpAkEAs5abSwyPFMKkrch+Lir0690LFKtEr+bLNat689eM/ddHpbrIWrZx\ndVM+ANa0cepl+Uo1Pp2YzOI2To2+L29jdQJAKf7iPC0rq6hlOrW+rCe5kod9ViSi\nyRG7JZI/A5EsIVFE1mn4ziVDtd69zrmOgqPT+ltIRkiDHxED710P/LUkkQJANNzB\nK28v8sF0rf7VPYvBemgfad8cIdcCu/KVB4/MXa/v1BXOAf2wGgP9vUt15A5GJAI2\n+A51uuFfcPICKH5WPQJBAJ1ZuK956dIpCb3SMTNYfLX600FWtsxaseu/Q6cxt+UN\nvpNwhHVPR06zaZHErq4FiWk2QlwnAc03yccRYSjT0E4=\n-----END RSA PRIVATE KEY-----"

# Import environment specific config. This must remain at the bottom
# of this file so it overrides the configuration defined above.
import_config "#{config_env()}.exs"
