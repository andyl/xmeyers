defmodule Xmeyers.IndexPage do
  use Tableau.Page, layout: Xmeyers.RootLayout, permalink: "/"
  use Phoenix.Component
  import Xmeyers.Components.Cards

  def template(assigns) do
    ~H"""
    <.cardpage datalist={@data["home"]} color="blue" />
    """
  end
end
