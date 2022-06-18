import Config

# We don't run a server during test. If one is required,
# you can enable the server option below.
config :ex_chat, ExChatWeb.Endpoint,
  http: [ip: {127, 0, 0, 1}, port: 4002],
  secret_key_base: "tXfILW0ISUevk6X7QxriFVpPiEXAkNMlv3IJEmBFU7g2BthSyblLWYuhilf4b6Yo",
  server: false

# In test we don't send emails.
config :ex_chat, ExChat.Mailer,
  adapter: Swoosh.Adapters.Test

# Print only warnings and errors during test
config :logger, level: :warn

# Initialize plugs at runtime for faster test compilation
config :phoenix, :plug_init_mode, :runtime
