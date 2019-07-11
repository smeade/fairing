# This file is responsible for configuring your application
# and its dependencies with the aid of the Mix.Config module.
#
# This configuration file is loaded before any dependency and
# is restricted to this project.

# General application configuration
use Mix.Config

config :fairing,
  ecto_repos: [Fairing.Repo]

# Configures the endpoint
config :fairing, FairingWeb.Endpoint,
  url: [host: "localhost"],
  secret_key_base: "hIpZTpy53CKlXBNSfwIn3osQtJbxx4ec1gRGuEHh9j1ahyQNq9XAXFtK65Ngy1Kc",
  render_errors: [view: FairingWeb.ErrorView, accepts: ~w(html json)],
  pubsub: [name: Fairing.PubSub, adapter: Phoenix.PubSub.PG2]

# Configures Elixir's Logger
config :logger, :console,
  format: "$time $metadata[$level] $message\n",
  metadata: [:request_id]

# Use Jason for JSON parsing in Phoenix
config :phoenix, :json_library, Jason

# Import environment specific config. This must remain at the bottom
# of this file so it overrides the configuration defined above.
import_config "#{Mix.env()}.exs"
