defmodule ExChatWeb.PageLive do
  use ExChatWeb, :live_view
  require Logger

  @impl true
  def mount(_params, _session, socket) do
    {:ok, assign(socket, query: "", results: %{})}
  end

  @impl true
  def handle_event("random-room", _params, socket) do
    r_slug = "/room/" <> MnemonicSlugs.generate_slug(3)
    {:noreply, push_redirect(socket, to: r_slug)}
  end
end
