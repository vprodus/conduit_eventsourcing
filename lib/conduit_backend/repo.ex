defmodule ConduitBackend.Repo do
  use Ecto.Repo,
    otp_app: :conduit_backend,
    adapter: Ecto.Adapters.Postgres
end
