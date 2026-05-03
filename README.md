# daniel-industries
[daniel.industries](https://daniel.industries)

## Local development

Use the dev config for faster local rebuilds:

```sh
bundle exec jekyll s --config _config.yml,_config.dev.yml
```

I'm currently using asdf:

```sh
asdf exec bundle exec jekyll s --config _config.yml,_config.dev.yml
```

or

```sh
asdf exec bundle exec jekyll s --incremental --config _config.yml,_config.dev.yml
```

I have a bash script aliased so I can

```
be jekyll s --incremental --config _config.yml,_config.dev.yml
```

`_config.dev.yml` enables incremental builds and skips the heaviest archive/category pages during normal local iteration.
