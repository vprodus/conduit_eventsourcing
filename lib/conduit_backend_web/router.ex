defmodule ConduitBackendWeb.Router do
  use ConduitBackendWeb, :router

  pipeline :api do
    plug :accepts, ["json"]
  end

  scope "/api", ConduitBackendWeb do
    pipe_through :api
  end
end
