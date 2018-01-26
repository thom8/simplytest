# Docker compose / Kubernetes simplytest.me

![](https://tokei.rs/b1/github/thom8/simplytest)

## Requirements

- [docker](https://docs.docker.com/engine/installation/) /w docker compose

## Example

`VERSION="8" PACKAGE="drupal/token" docker-compose up -d`

## URL

`http://localhost:8000/`

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

# Kubernetes (helm) - simplytest.me

## Requirements

- [minikube](https://kubernetes.io/docs/getting-started-guides/minikube/#installation)
- [helm](https://github.com/kubernetes/helm/blob/master/docs/install.md)

## Setup

```bash
git clone https://github.com/thom8/simplytest.git simplytest-k8s && cd $_
minikube start
helm init
```

You should now be inside the project directory with a local k8s cluster running with helm installed.

## Launch first instance

`helm install --set version="8" --set package="drupal/token" ./simplytest`

The initial load will take a few minutes as it needs to download the images to the cluster, however subsequent installs can reuse these images.

`--set` arguments override the default values in `simplytest/values.yaml`

The project will be given a random name and you can access the site by running `minikube service [project-name]`

## List all instances

`helm ls` -- Will display a list of currently deployed projects.

## Delete project

`helm delete [project-name]` (as defined in `helm ls`)

## Access the Kubernetes dashboard

`minikube dashboard`

## Note

Running this project via minikube is much slower than a cloud based cluster so this is only an example of how it works, not how it performs.
