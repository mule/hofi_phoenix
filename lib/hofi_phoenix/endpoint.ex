defmodule HofiPhoenix.Endpoint do
  use Phoenix.Endpoint, otp_app: :hofi_phoenix

  socket "/socket", HofiPhoenix.UserSocket

  # Serve at "/" the static files from "priv/static" directory.
  #
  # You should set gzip to true if you are running phoenix.digest
  # when deploying your static files in production.
  plug Plug.Static,
    at: "/", from: :hofi_phoenix, gzip: false,
    only: ~w(css fonts images js favicon.ico robots.txt)

  # Code reloading can be explicitly enabled under the
  # :code_reloader configuration of your endpoint.
  if code_reloading? do
    socket "/phoenix/live_reload/socket", Phoenix.LiveReloader.Socket
    plug Phoenix.LiveReloader
    plug Phoenix.CodeReloader
  end

  plug Plug.RequestId
  plug Plug.Logger

  plug Plug.Parsers,
    parsers: [:urlencoded, :multipart, :json,  Absinthe.Plug.Parser],
    pass: ["*/*"],
    json_decoder: Poison

  plug Plug.MethodOverride
  plug Plug.Head


  plug Plug.Session,
    store: :cookie,
    key: "_hofi_phoenix_key",
    signing_salt: "7xbl2HVd"

  plug HofiPhoenix.Router
end
