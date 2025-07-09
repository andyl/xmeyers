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
      <div class={"px-4 bg-#{@color}-100 border-gray-200 rounded-t-lg"}>
        { @title }
      </div>
      <div class="my-2 px-4 text-sm text-gray-500">
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
    <p>{@txt}</p>
    """
  end

  def url_block(assigns) do
    ~H"""
    <p>
    <a target="_blank" href={@url}>{@lbl}</a>
    </p>
    """
  end
end
