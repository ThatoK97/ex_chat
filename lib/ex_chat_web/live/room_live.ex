defmodule ExChatWeb.RoomLive do
  use ExChatWeb, :live_view
  require Logger

  @impl true
  def mount(%{"id" => room_id}, _session, socket) do
    topic = "Room: " <> room_id
    username = MnemonicSlugs.generate_slug(2)
    if connected?(socket), do: ExChatWeb.Endpoint.subscribe(topic)

    {:ok, assign(socket,
      room_id: room_id,
      topic: topic,
      username: username,
      message: "",
      messages: [%{uuid: UUID.uuid4(), text: "#{username} joined chat!"}],
      temporary_assigns: [messages: []]
      )}
    end

  @impl true
  def handle_event("submit_msg", %{"chat" => %{"message" => message}}, socket) do
    message = %{uuid: UUID.uuid4(), text: message}
    :ok = ExChatWeb.Endpoint.broadcast(socket.assigns.topic, "new-messsage", message)
    {:noreply, assign(socket, message: "")}
  end

  @impl true
  def handle_event("form_update", %{"chat" => %{"message" => message}}, socket) do
    Logger.info(message: message)
    {:noreply, assign(socket, message: message)}
  end

  @impl true
  def handle_info(%{event: "new-message", payload: message}, socket) do
    Logger.info(payload: message)
    {:noreply, assign(socket, messages: [message])}
    # {:noreply, assign(socket, messages: List.insert_at(socket.assigns.messages, -1, message))}
  end
end
