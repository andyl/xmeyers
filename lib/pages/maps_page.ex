defmodule Xmeyers.MapsPage do
  use Tableau.Page, layout: Xmeyers.RootLayout, permalink: "/maps"
  use Phoenix.Component
  import Xmeyers.Components.Cards

  def template(assigns) do
    ~H"""
    <.cardpage datalist={@data["maps"]} color="green" />
    """
  end
end
