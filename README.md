# BrainBro for Umbrel

The [Community App Store](https://github.com/getumbrel/umbrel-community-app-store) for
[BrainBro](https://github.com/TheBrainBro/brainbro), a self-hosted second brain, on umbrelOS.

## Install

1. In umbrelOS, open the **App Store**, then the **⋯** menu, **Community App Stores**.
2. Paste `https://github.com/TheBrainBro/brainbro-umbrel-app` and click **Add**.
3. Open the **BrainBro App Store** and install **BrainBro**.
4. Open BrainBro and sign in as `umbrel`, with the password shown on the app's page in
   umbrelOS.

Umbrel's own sign-in is off for this app: BrainBro has its own, and the API, MCP and the
Telegram webhook must be reachable by clients that aren't browsers.

## What is in it

| Path | |
|---|---|
| `umbrel-app-store.yml` | The store: its id (`brainbro`, the prefix of every app id) and name. |
| `brainbro-app/umbrel-app.yml` | The listing umbrelOS shows. |
| `brainbro-app/docker-compose.yml` | The services, from `docker-compose.production.yml` in the BrainBro repository. |
| `brainbro-app/exports.sh` | Secrets derived from the device seed (`SECRET_KEY`, the database password). |
| `brainbro-app/data/` | The folders the services keep their data in, under the app's data directory. |

Images are pinned to a version and its multi-arch digest (`linux/amd64`, `linux/arm64`).

## Updating to a new BrainBro release

1. Get the digests of the new images:

   ```bash
   docker buildx imagetools inspect ghcr.io/thebrainbro/brainbro:X.Y.Z
   docker buildx imagetools inspect ghcr.io/thebrainbro/brainbro-embedder:X.Y.Z
   ```

2. In `brainbro-app/docker-compose.yml`, change both images to `X.Y.Z@sha256:<digest>`.
3. In `brainbro-app/umbrel-app.yml`, change `version` and `releaseNotes`.

umbrelOS offers the update once the change is on `main`. On start, the `migrate` service backs
up the database before any pending migration and runs it.

## License

AGPL-3.0, as BrainBro.
