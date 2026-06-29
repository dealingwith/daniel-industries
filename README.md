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

## Build and deploy checks

Create a local `.env` for deploy credentials:

```sh
cp .env.example .env
```

Set `DEPLOY_SSH_USER` to the SSH user and host used by rsync deploys.
The Rakefile loads `.env` with the `dotenv` gem.

Production Rake builds use Jekyll incremental mode and preserve `_site/.jekyll-metadata` between deploys:

```sh
bundle exec jekyll build --incremental
```

Preview deploy changes without uploading or deleting remote files:

```sh
rake deploy:dry_run
```

Show itemized rsync changes during a normal deploy:

```sh
ITEMIZE=1 rake deploy
```
