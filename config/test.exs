import Config

# Configure your database
#
# The MIX_TEST_PARTITION environment variable can be used
# to provide built-in test partitioning in CI environment.
# Run `mix help test` for more information.
config :conduit_backend, ConduitBackend.Repo,
  username: "postgres",
  password: "postgres",
  hostname: "localhost",
  database: "conduit_readstore_test",
  pool: Ecto.Adapters.SQL.Sandbox,
  pool_size: 10

config :conduit_backend, ConduitBackend.EventStore,
  serializer: Commanded.Serialization.JsonSerializer,
  username: "postgres",
  password: "postgres",
  database: "conduit_eventstore_test",
  hostname: "localhost",
  pool_size: 10

# We don't run a server during test. If one is required,
# you can enable the server option below.
config :conduit_backend, ConduitBackendWeb.Endpoint,
  http: [ip: {127, 0, 0, 1}, port: 4002],
  secret_key_base: "GEryU9+MbXcSBEp4QZdBSOL7SRe5GjMGhNw+eKbg83qSAzP6wQR/mSPQReOEnvSZ",
  server: false

# Print only warnings and errors during test
config :logger, level: :warning

# Initialize plugs at runtime for faster test compilation
config :phoenix, :plug_init_mode, :runtime
