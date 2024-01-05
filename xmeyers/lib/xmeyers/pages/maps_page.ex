defmodule Xmeyers.MapPage do
  use Tableau.Page, layout: Xmeyers.RootLayout, permalink: "/maps"
  use Phoenix.Component

  def template(assigns) do
    assigns = Map.put(assigns, :home_cards, map_cards(assigns))
    ~H"""
    <.showcards cards={@home_cards} />
    """
  end

  defp showcards(assigns) do
    ~H"""
    <div class="p-4 grid lg:grid-cols-3 sm:grid-cols-2 gap-4">
      <%= for card <- @cards do %>
        <div class="relative border border-gray-300 rounded-lg shadow-sm space-x-3">
          <div class="px-4 bg-green-100 border-gray-200 rounded-t-lg">
            <%= card.title %>
          </div>

          <div class="my-2 text-sm text-gray-500">
            <%= card.body %>
          </div>
        </div>
      <% end %>
    </div>
    """
  end

  defp map_cards(assigns) do
    assigns.card_data
    |> Enum.filter(fn card -> String.contains?(card.path, "map") end)
    |> Enum.sort(fn card1, card2 -> compare(card1, card2) end)
  end

  defp compare(c1, c2) do
    "#{c1.weight} #{c1.title}" < "#{c2.weight} #{c2.title}"
  end
end
