defmodule KiranmaiElixirTestWeb.PageLive do
  use Phoenix.LiveView

  def render(assigns) do
    ~L"""
    <%= live_render("page.html", @assigns) %>
    """
  end

  def mount(_params, _session, socket) do
    {:ok, assign(socket, items: ["Item 1", "Item 2"])}
  end

  def handle_event("add_item", _, socket) do
    updated_items = ["New Item" | socket.assigns.items]
    {:noreply, assign(socket, items: updated_items)}
  end

  defp render_items(items) do
    ~L"""
    <ul>
      <%= for item <- unquote(items) do %>
        <li><%= item %></li>
      <% end %>
    </ul>
    """
  end
end
