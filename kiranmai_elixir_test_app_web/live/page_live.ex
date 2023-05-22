defmodule KiranmaiElixirTestApp.Web.Page do
  use Phoenix.LiveView

  def render(assigns) do
    ~H"""
    <div class="container">
      <h1>Welcome to Kiranmai Elixir Test App!</h1>
      <p>Current time: <%= @current_time %></p>
      <ul>
        <%= for item <- @items do %>
          <li><%= item %></li>
        <% end %>
      </ul>
      <button phx-click="add_item">Add Item</button>
    </div>
    """
  end

  def mount(_params, _session, socket) do
    {:ok, assign(socket, current_time: DateTime.utc_now(), items: ["Item 1", "Item 2"])}
  end

  def handle_event("add_item", _, socket) do
    updated_items = ["New Item" | socket.assigns.items]
    {:noreply, assign(socket, items: updated_items)}
  end
end
