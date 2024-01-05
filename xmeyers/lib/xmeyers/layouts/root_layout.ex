defmodule Xmeyers.RootLayout do
  use Tableau.Layout
  use Phoenix.Component

  def template(assigns) do
    ~H"""
    <!DOCTYPE html>
    <html>
      <head>
        <title>XMEYERS</title>
        <link rel="icon" href="/stat1/static/img/favicon.ico" type="image/x-icon" />
        <link rel="stylesheet" type="text/css" href="/stat1/css/site.css" />
        <style>
          a { color: blue; text-decoration: none; font-weight: normal; }
          a:hover { text-decoration: underline; }
          ul, ol { list-style-type: none; }
          li { padding-left: 0; margin-left: 0; }
        </style>
      </head>

      <body>
        <div class="px-3 bg-gray-100 md:flex md:items-center md:justify-between">
          <div class="flex-1 min-w-0">
            <div class="text-2xl text-gray-900 leading-7 sm:text-3xl sm:truncate">
              <img
                class="inline align-middle"
                style="padding-bottom: 3px;"
                src="/stat1/static/img/mountain-15-32.png"
              /> Xmeyers
            </div>
          </div>
          <div class="flex mt-4 md:mt-0 md:ml-4"></div>
        </div>
        <%= render(@inner_content) %>
      </body>
      <%= if Mix.env() == :dev do %>
        <%= Tableau.live_reload(assigns) %>
      <% end %>
    </html>
    """
    |> Phoenix.HTML.Safe.to_iodata()
    |> IO.iodata_to_binary()
    |> HtmlEntities.decode()
  end
end
