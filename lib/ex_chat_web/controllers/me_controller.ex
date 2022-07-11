defmodule ExChatWeb.MeController do
  use ExChatWeb, :controller

  @spec index(Plug.Conn.t(), any) :: Plug.Conn.t()
  def index(conn, _params) do
    render(conn, "index.html")
  end

  @spec show(Plug.Conn.t(), any) :: Plug.Conn.t()
  def show(conn, %{"messenger" => messenger}) do
    render(conn, :show, messenger: messenger)
  end
end
