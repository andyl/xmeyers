defmodule Xmeyers.RootLayout do
  use Tableau.Layout
  use Phoenix.Component

  def template(assigns) do
    ~H"""
    <!DOCTYPE html>
    <html>
      <head>
        <title>Xmeyers</title>
        <link rel="icon" href="/xmeyers/static/img/favicon.ico" type="image/x-icon" />
        <link rel="stylesheet" type="text/css" href="/xmeyers/css/site.css" />
        <style>
          a { color: blue; text-decoration: none; font-weight: normal; }
          a:hover { text-decoration: underline; }
          ul, ol { list-style-type: none; }
          li { padding-left: 0; margin-left: 0; }
          .cctv-webcam {width: 320px;height: 400px;background-color: #ffffff;}
        </style>
        <%= if Mix.env() == :prod do %>
          <script defer data-domain="xmeyers" src="https://plausible.io/js/script.js">
          </script>
        <% end %>
      </head>

      <body>
        <div class="bg-gray-100 md:flex md:items-center md:justify-between">
          <div class="flex-1 min-w-0">
            <div class="py-2 px-4 text-2xl text-gray-900 leading-7 sm:text-3xl sm:truncate">
              <.navlogo plink={@page.permalink} />
              <.navbar plink={@page.permalink} />
            </div>
          </div>
          <div class="flex mt-4 md:mt-0 md:ml-4"></div>
        </div>
        {render(@inner_content)}
      </body>
      <%= if Mix.env() == :dev do %>
        {Tableau.live_reload(assigns)}
      <% end %>
    </html>
    """
    |> Phoenix.HTML.Safe.to_iodata()
    |> IO.iodata_to_binary()
    |> HtmlEntities.decode()
  end

  defp navbar(assigns) do
    ~H"""
    <div class="inline text-xs pl-8">
      <.navlink label="Home" plink={@plink} ref="/" /> |
      <.navlink label="Cams" plink={@plink} ref="/cams" /> |
      <.navlink label="Maps" plink={@plink} ref="/maps" />
    </div>
    """
  end

  defp logo(assigns) do
    ~H"""
    <img
      class="inline align-middle"
      style="padding-bottom: 3px;"
      src="/xmeyers/static/img/mountain-15-32.png"
    /> Xmeyers
    """
  end

  defp navlogo(assigns) do
    ~H"""
    <%= if "/" != @plink do %>
      <a href="/xmeyers/" class="font-normal hover:text-blue" style="color: black;"><.logo /></a>
    <% else %>
      <.logo />
    <% end %>
    """
  end

  defp navlink(assigns) do
    ~H"""
    <%= if @ref != @plink do %>
      <a href={"/xmeyers#{@ref}"}>{@label}</a>
    <% else %>
      <bold>{@label}</bold>
    <% end %>
    """
  end
end
