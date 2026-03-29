# daniel-industries
[daniel.industries](https://daniel.industries)

## Local development

Use the dev config for faster local rebuilds:

```sh
bundle exec jekyll serve --config _config.yml,_config.dev.yml
```

I'm currently using asdf:

```sh
asdf exec jekyll s --config _config.yml,_config.dev.yml
```

`_config.dev.yml` enables incremental builds and skips the heaviest archive/category pages during normal local iteration.
