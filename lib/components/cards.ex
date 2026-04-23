defmodule Xmeyers.Components.Cards do
  use Phoenix.Component

  def cardpage(assigns) do
    ~H"""
    <div class="p-4 grid lg:grid-cols-3 sm:grid-cols-2 gap-4">
    <%= for map <- @datalist, {title, blocks} <- Map.to_list(map) do %>
      <.showcard title={title} blocks={blocks} color={@color} />
    <% end %>
    </div>
    """
  end

  def showcard(assigns) do
    ~H"""
    <div class="relative border border-gray-300 rounded-lg shadow-sm">
      <div class={"px-4 py-2 bg-#{@color}-100 border-gray-200 rounded-t-lg font-medium"}>
        { @title }
      </div>
      <div class="py-2 text-base lg:text-sm text-gray-600">
        <%= for block <- @blocks do %>
          <.showblock block={block} />
        <% end %>
      </div>
    </div>
    """
  end

  def showblock(assigns) do
    ~H"""
    <%= case @block do %>
      <% %{"txt" => txt} -> %>
        <.txt_block txt={txt} />
      <% %{"url" => url, "lbl" => lbl} -> %>
        <.url_block url={url} lbl={lbl} />
    <% end %>
    """
  end

  def txt_block(assigns) do
    ~H"""
    <p class="px-4 py-1">{@txt}</p>
    """
  end

  def url_block(assigns) do
    ~H"""
    <a
      target="_blank"
      href={@url}
      class="block px-4 py-3 min-h-11 text-blue-600 hover:bg-gray-100 active:bg-gray-200 border-b border-gray-100 last:border-b-0 lg:py-1 lg:min-h-0 lg:hover:bg-transparent lg:active:bg-transparent lg:border-b-0"
    >
      {@lbl}
    </a>
    """
  end
end
