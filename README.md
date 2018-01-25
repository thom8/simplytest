# Docker compose / Kubernetes simplytest.me

## Requirements

- [docker](https://docs.docker.com/engine/installation/) /w docker compose

## Example

`VERSION="8" PACKAGE="drupal/token" docker-compose up -d`

## Usage

Drupal core version and packages are defined by environment variables.

Drupal version. (default) 
 - only 7 & 8 are supported due to composer.

    `VERSION="8"`

Composer package(s). (required)
  - supports specific version.
  - supports multiple packages.
  - variable is passed directly to require so all options are supported too.
  https://getcomposer.org/doc/03-cli.md#require

    `PACKAGE="drupal/token"`

## Logs

Follow the composer installation logs
  - the webserver will only start once install is completed. 

`docker-compose logs -f drupal`

## CLI access

`docker-compose exec drupal bash`

# Kubernetes (helm) simplytest.me

docs coming soon.
