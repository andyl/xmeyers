# Project: Tableau Static Site

A static website built with [Tableau](https://github.com/elixir-tools/tableau),
Elixir's SSG. Generates plain HTML to `_site/` for deployment to Netlify /
GitHub Pages / S3 / Cloudflare Pages.

## Stack

- **SSG**: Tableau (Elixir)
- **Templates**: HEEx (`Phoenix.Component`, `~H` sigil)
- **Styling**: Tailwind CSS v4 
- **Build**: the `:tailwind` hex package 
- **Runtime MCP**: Tidewave mounted standalone via Bandit on port 4000

## Project layout

```
.
├── lib/
│   ├── layouts/         # modules using `use Tableau.Layout`, HEEx templates
│   ├── pages/           # modules using `use Tableau.Page`
│   └── components/      # shared HEEx function components
├── _posts/              # markdown posts (front-matter + body)
├── assets/
│   ├── css/app.css      # @import "tailwindcss"; @plugin "daisyui";
│   └── package.json     # tailwindcss, @tailwindcss/cli, daisyui
├── extra/               # static files copied verbatim to _site/
├── config/
│   ├── config.exs       # :tableau config, assets watchers
│   └── dev.exs
├── _site/               # BUILD OUTPUT — never edit by hand, never commit
└── mix.exs
```

## Commands

| Task                             | Command                                |
|----------------------------------|----------------------------------------|
| Dev server (live reload)         | `mix tableau.server`                   |
| One-shot build                   | `mix tableau.build`                    |
| Tidewave MCP (separate terminal) | `mix tide`                             |
| Format                           | `mix format`                           |
| Add a dep                        | `mix deps.get` after editing `mix.exs` |

The Tailwind watcher is started automatically by `mix tableau.server` via the `:tableau, :assets` config — no separate `npm run` needed in dev.

## Conventions

### Pages and layouts

- A page module lives in `lib/pages/` and `use Tableau.Page`. Its `template/1` returns a HEEx `~H` block. The layout is selected via the `layout:` option to `use Tableau.Page`.
- Layouts live in `lib/layouts/` and `use Tableau.Layout`. Render child content with `<%= @inner_content %>` (it's already rendered HTML — do not re-escape).
- `@page` and `@site` are always in scope inside layouts and pages. Use `@page.title`, `@page.permalink`, etc. Arbitrary front-matter keys show up as `@page.<key>`.

### HEEx specifics (easy to get wrong)

- Attribute interpolation uses `{...}`, not `<%= ... %>`: `<a href={@page.permalink}>`.
- Function components are called with a dot: `<.button variant="primary">Click</.button>`, defined with `attr :variant, :string` + `def button(assigns)`.
- Slots use `<:slot_name>`, not block passing.
- `<%= ... %>` is still used for text-position interpolation inside the template body.

### Styling

- Prefer DaisyUI semantic classes (`btn`, `card`, `navbar`, `badge`) over raw Tailwind where a component exists. Fall back to Tailwind utilities for spacing, layout, and one-off tweaks.
- Colors: use DaisyUI tokens (`bg-primary`, `text-base-content`, `border-base-300`) rather than raw Tailwind color scales. This keeps theme switching working.
- Themes are configured in `assets/css/app.css` inside the `@plugin "daisyui" { themes: ... }` block. Default is `light --default, dark --prefersdark` unless overridden.
- DO NOT hand-edit `_site/css/site.css` — it's generated.

### Markdown posts

- Posts in `_posts/` use YAML front-matter. The `Tableau.PostExtension` picks them up; `layout`, `title`, `date`, `permalink` are the standard keys.
- The default converter is `Tableau.MDExConverter`. Code blocks support syntax highlighting via the configured highlighter.

## Tidewave MCP — when to use it

Tidewave runs as a standalone Bandit app on `http://localhost:4000/tidewave/mcp`. It does NOT serve the website — `mix tableau.server` does that on its own port. Keep both running during dev.

Prefer Tidewave tools over guessing:

- **`get_docs`** — pull docs for `Tableau.Page`, `Phoenix.Component`, `MDEx`, etc. pinned to the exact version in `mix.lock`. Do this BEFORE writing code against an API you're not 100% sure about; Tableau and Phoenix.Component APIs have version-to-version differences.
- **`get_source_location`** — jump directly to a module/function definition in deps. Faster than grepping `deps/`.
- **`search_package_docs`** — hexdocs search scoped to this project's deps.
- **`project_eval`** — evaluate Elixir in the running MCP app. Useful for testing a converter, checking what `Tableau.Page.__tableau_type__/0` returns, inspecting config, etc. Note: this evaluates inside the Tidewave standalone app, not inside `mix tableau.server`, so Tableau's page modules may not be loaded there — limit this to library-level checks.

Not useful here (SSG has no runtime DB / LiveView): `execute_sql_query`, `get_ecto_schemas`, LiveView DOM introspection.

## Writing code: defaults

- When adding a component, put it in `lib/components/` as a `Phoenix.Component` module, declare `attr` and `slot` explicitly, and import it where used.
- New pages default to the site's main layout unless told otherwise.
- Accessibility: use semantic HTML (`<nav>`, `<main>`, `<article>`), label interactive elements, respect `prefers-reduced-motion` for any animation.
- Images go in `extra/images/` and are referenced as `/images/foo.png` (the `extra/` prefix is stripped on copy).
- Keep external JS minimal. Prefer CSS-only DaisyUI components (dropdown, modal, drawer all work without JS) over pulling in Alpine/htmx unless asked.

## Things not to do

- Don't edit `_site/`.
- Don't switch the Tailwind watcher to the `:tailwind` hex package — DaisyUI will silently stop working.
- Don't add Phoenix or Ecto as dependencies. This is a static site; no router, no endpoint, no DB.
- Don't reach for a JS framework reflexively. If something genuinely needs client state, ask first.
- Don't reproduce verbatim blocks of DaisyUI documentation examples into components without adapting them to this project's theme tokens.

## When in doubt

1. Read the relevant module source via `get_source_location` before writing code against it.
2. `get_docs` for the exact dep version before trusting training-data memory on HEEx / Tableau / MDEx APIs.
3. If a visual change is ambiguous ("make the nav nicer"), propose 2 concrete options before editing.
