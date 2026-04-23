import Config

config :tableau, Tableau.PageExtension, dir: ["_pages", "_wip"]
config :tableau, Tableau.PostExtension, future: true, dir: ["_posts", "_drafts"]

config :phoenix_live_view,
  debug_heex_annotations: true,
  debug_attributes: true
