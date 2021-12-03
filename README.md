# vuln-graphql-api

This fork of [vulnerable-graphql-api](https://github.com/CarveSystems/vulnerable-graphql-api) simplifies and cleans up the Docker build for quick deployment and testing with docker-compose.

## Docker Build

- Make sure _docker-compose_ is present on the system.
- Set `SERVER_PORT` in the environment and run `docker-compose up`

```bash
docker-compose up
```

By default, the app will listen on port 3000.

```bash
open http://localhost:3000
```

## GitHub Actions Workflow

A sample GitHub Actions workflow is available at `stackhawk.d/.github/workflows/build-and-scan.yml`. Move it to the standard location in `.github/workflows` to enable it.

## StackHawk Example Configurations

Sample StackHawk configuration files are available under `stackhawk.d`.
