# Docker Compose

This directory contains the Docker Compose stacks for the homelab. Each service, or group of related services, should live in its own directory with the main file named `docker-compose.yaml`.

## Expected Structure

```text
docker-compose/
  service-name/
    docker-compose.yaml
    .env
    config/
```

- Use lowercase kebab-case for new directories, for example `uptime-kuma` or `grafana-stack`.
- Keep service configuration files inside the stack directory.
- Use `.env` for local variables such as domain, hostname, timezone, and volume paths.
- Never commit tokens, passwords, private keys, or real secrets.
- Prefer the external `server-backend` network for services published through Traefik.

## Creating a New Compose Stack

1. Create a directory for the service:

   ```sh
   mkdir -p docker-compose/service-name
   ```

2. Create the `docker-compose.yaml` file inside that directory.

3. Add a local `.env` file when the stack needs variables:

   ```env
   TZ=America/Sao_Paulo
   DOMAIN=example.com
   SERVER=falcon
   DOCKER_DATA=/DATA/AppData
   ```

4. Validate the syntax before starting the service:

   ```sh
   docker compose -f docker-compose/service-name/docker-compose.yaml config
   ```

5. Start the stack:

   ```sh
   docker compose -f docker-compose/service-name/docker-compose.yaml up -d
   ```

## Template

Keep service fields in this order to make compose files easier to read, review, and maintain:

```yaml
---
services:
  service-name:
    # 1. Container
    image: vendor/image:tag
    container_name: service-name
    hostname: service-name
    restart: unless-stopped
    pull_policy: missing
    user: "1000:1000"

    # 2. Command / Entrypoint
    command: []
    entrypoint: []

    # 3. Environment
    environment:
      - TZ=${TZ}
    env_file:
      - .env

    # 4. Volumes
    volumes:
      - ${DOCKER_DATA}/service-name:/data

    # 5. Ports
    # Avoid exposing ports when access is handled by Traefik.
    ports:
      - 8080:80

    # 6. Networks
    networks:
      - server-backend

    # 7. Labels
    labels:
      - traefik.enable=true
      - traefik.http.routers.service-name.entrypoints=https
      - traefik.http.routers.service-name.rule=Host(`service-name.${SERVER}.${DOMAIN}`)
      - traefik.http.routers.service-name.tls=true
      - traefik.http.routers.service-name.tls.certresolver=cloudflare
      - traefik.http.routers.service-name.service=service-name
      - traefik.http.services.service-name.loadbalancer.server.port=80
      - traefik.http.routers.service-name.middlewares=authentik@file

    # 8. Healthcheck
    healthcheck:
      test: ["CMD", "wget", "--spider", "-q", "http://localhost:80"]
      interval: 30s
      timeout: 5s
      retries: 3

    # 9. Dependencies
    depends_on: []

    # 10. Devices
    devices: []

    # 11. Resources
    deploy:
      resources:
        limits:
          memory: 512M

    # 12. Extends
    extends: {}

    # 13. Capabilities
    cap_add: []

    # 14. Security
    security_opt: []

networks:
  server-backend:
    external: true

volumes: {}

configs: {}

secrets: {}
```

Remove empty fields, or fields the service does not use, from the final compose file. The template is a reference for order and conventions, not a requirement to fill every option.
