# vuln-graphql-api

This fork of [vulnerable-graphql-api](https://github.com/CarveSystems/vulnerable-graphql-api) simplifies and cleans up the Docker build for quick deployment and testing with docker-compose.

## Docker Build

- Make sure _docker-compose_ is present on the system.
- Set `SERVER_PORT` in the environment and run `docker-compose up`

```bash
export SERVER_PORT=3000
docker-compose up
```
