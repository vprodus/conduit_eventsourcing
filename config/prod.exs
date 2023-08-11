import Config

# Do not print debug messages in production
config :logger, level: :info

# Runtime production configuration, including reading
# of environment variables, is done on config/runtime.exs.
# Configure your database
config :conduit_backend, ConduitBackend.Repo,
  username: "postgres",
  password: "postgres",
  hostname: "localhost",
  database: "conduit_readstore_prod",
  stacktrace: true,
  show_sensitive_data_on_connection_error: true,
  pool_size: 10

config :conduit_backend, ConduitBackend.EventStore,
  serializer: Commanded.Serialization.JsonSerializer,
  username: "postgres",
  password: "postgres",
  database: "conduit_eventstore_prod",
  hostname: "localhost",
  pool_size: 10
