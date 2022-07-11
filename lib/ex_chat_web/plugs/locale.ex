defmodule ExChatWeb.Plugs.Locale do
  import Plug.Conn

  @locales ["rsa", "zim", "ke", "rwa", "b"]

  def init(default), do: default

  def call(%Plug.Conn{params: %{"locale" => locale}} = conn, _default) when locale in @locales do
    assign(conn, :locale, locale)
  end
  def call(conn, default) do
    assign(conn, :locale, default)
  end
end
