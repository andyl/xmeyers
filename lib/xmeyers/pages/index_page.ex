defmodule Xmeyers.IndexPage do
  use Tableau.Page, layout: Xmeyers.RootLayout, permalink: "/"
  use Phoenix.Component
  import Xmeyers.Components.Cards

  def template(assigns) do
    ~H"""
    <div class="p-4 grid lg:grid-cols-3 sm:grid-cols-2 gap-4">
    <%= for map <- @data["home"], {title, blocks} <- Map.to_list(map) do %>
      <.showcard title={title} blocks={blocks} color="blue" />
    <% end %>
    </div>
    """
  end

end
