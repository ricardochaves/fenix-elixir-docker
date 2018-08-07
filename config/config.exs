# This file is responsible for configuring your application
# and its dependencies with the aid of the Mix.Config module.
#
# This configuration file is loaded before any dependency and
# is restricted to this project.
use Mix.Config

# General application configuration
config :oraculo,
  ecto_repos: [Oraculo.Repo]

# Configures the endpoint
config :oraculo, OraculoWeb.Endpoint,
  url: [host: "localhost"],
  secret_key_base: "Uc1BjN8ijmrRIBZme6E9xO4E9I7w0urwfUyi9eTpkh+8pntaz0NWWysCRh9Z83Hb",
  render_errors: [view: OraculoWeb.ErrorView, accepts: ~w(html json)],
  pubsub: [name: Oraculo.PubSub,
           adapter: Phoenix.PubSub.PG2]

# Configures Elixir's Logger
config :logger, :console,
  format: "$time $metadata[$level] $message\n",
  metadata: [:user_id]

# Import environment specific config. This must remain at the bottom
# of this file so it overrides the configuration defined above.
import_config "#{Mix.env}.exs"
