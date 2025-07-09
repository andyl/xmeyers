defmodule Xmeyers.AltPage do
  use Tableau.Page, layout: Xmeyers.RootLayout, permalink: "/"
  use Phoenix.Component

  def template(assigns) do
    ~H"""
    <div class="p-4 grid lg:grid-cols-3 sm:grid-cols-2 gap-4">
    <%= for map <- @data["home"], {title, blocks} <- Map.to_list(map) do %>
      <.showcard title={title} blocks={blocks} />
    <% end %>
    </div>
    """
  end

  defp showcard(assigns) do
    ~H"""
    <div class="relative border border-gray-300 rounded-lg shadow-sm space-x-3">
      <div class="px-4 bg-blue-100 border-gray-200 rounded-t-lg">
        { @title }
      </div>
      <div class="my-2 text-sm text-gray-500">
        <%= for block <- @blocks do %>
          <.showblock block={block} />
        <% end %>
      </div>
    </div>
    """
  end

  defp showblock(assigns) do
    ~H"""
    <%= case @block do %>
      <% %{"txt" => txt} -> %>
        <.txt_block txt={txt} />
      <% %{"url" => url, "lbl" => lbl} -> %>
        <.url_block url={url} lbl={lbl} />
    <% end %>
    """
  end

  defp txt_block(assigns) do
    ~H"""
    <p>{@txt}</p>
    """
  end

  defp url_block(assigns) do
    ~H"""
    <p>
    <a target="_blank" href={@url}>{@lbl}</a>
    </p>
    """
  end
end
