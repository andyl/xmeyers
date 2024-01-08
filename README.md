# xmeyers

Weather, fire and road conditions for [Meyers, CA](https://en.wikipedia.org/wiki/Meyers,_California) 

Static HTML - public website at [andyl.github.io/xmeyers](https://andyl.github.io/xmeyers).

## Installing

```
# clone the repo 
> git clone https://github.com/andyl/xmeyers.git 
# install dependencies 
> cd xmeyers && mix deps.get
# build the pages 
> bin/build 
# start the development server 
> bin/serve 
# open a browser to `http://localhost:4999/xmeyers
```

## Editing

Content files are in `_cards/*.md`.

## Tableau SSG

The HTML is generated by [Tableau](https://github.com/elixir-tools/tableau).

This site uses a custom Tableau extension: [Cards](https://github.com/andyl/tableau_ext)

## Building

```
$ bin/serve
$ bin/build
```

## Deploying

The site is served using Github Pages

Build > Commit > Push

