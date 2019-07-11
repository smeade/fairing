use Mix.Config

# Configure your database
config :fairing, Fairing.Repo,
  username: "phx",
  password: "phx",
  database: "fairing_test",
  hostname: "localhost",
  pool: Ecto.Adapters.SQL.Sandbox

# We don't run a server during test. If one is required,
# you can enable the server option below.
config :fairing, FairingWeb.Endpoint,
  http: [port: 4002],
  server: false

# Print only warnings and errors during test
config :logger, level: :warn
