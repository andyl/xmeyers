# xmeyers

Weather, fire and road conditions for [Meyers, CA](https://en.wikipedia.org/wiki/Meyers,_California) 

Static HTML - public website at [andyl.github.io/xmeyers](https://andyl.github.io/xmeyers).

## Installing

Cloning the repo:

```
$ git clone https://github.com/andyl/xmeyers.git 
```

## Editing

Content files are in `_cards/*.md`.

## Tableau SSG

The HTML is generated by [Tableau](https://github.com/elixir-tools/tableau).

This site uses a custom extension: `Cards`.  See https://github.com/andyl/tableau_ext for more info.

## Building

```
$ bin/serve
$ bin/build
```

## Deploying

The site is served using Github Pages

Build > Commit > Push


