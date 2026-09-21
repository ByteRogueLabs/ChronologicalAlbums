# ChronologicalAlbums

This repository includes a minimal containerized app and GitHub Actions workflows
to build a Docker image and deploy it to self-hosted Windows or Raspberry Pi
runners.

## Local run

```bash
python3 app.py
```

The app listens on `PORT` (default `8080`) and responds with the value of
`MESSAGE`.

## Docker

Build locally:

```bash
docker build -t chronologicalalbums .
docker run --rm -p 8080:8080 chronologicalalbums
```

## GitHub Actions

- `.github/workflows/docker-image.yml` builds the image and pushes it to GHCR on
  non-PR runs.
- `.github/workflows/deploy.yml` deploys the image to a self-hosted runner.

### Expected self-hosted runner labels

- Windows host: `self-hosted`, `windows`
- Raspberry Pi host: `self-hosted`, `linux`, `raspberry-pi`

### Required deployment secrets

Configure the following repository or organization secrets for the deploy
workflow:

- `GHCR_USERNAME`
- `GHCR_TOKEN` with `packages:read`

The Windows deployment workflow assumes the runner's Docker engine is configured
to run Linux containers.
