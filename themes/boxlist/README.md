# hugo_boxlist

One-page flex box theme for Hugo

## Installation

1. Create new site:

```
$ hugo new site mysite
```

2. Add the theme:

```
$ cd mysite
$ git init
$ git submodule add https://github.com/andyl/hugo_boxlist.git themes/hugo_boxlist
```

3. Update site configuration

```
$ echo 'theme = "hugo_boxlist"' >> config.toml
```

4. Add some content

```
$ hugo new boxes/myfirstbox.md
```

5. Edit and customize

```
$ vim boxes/myfirstbox.md
```

6. Start the server

```
$ hugo server -D
```

7. Profit
