# BrainBro for Umbrel

The [Community App Store](https://github.com/getumbrel/umbrel-community-app-store) for
[BrainBro](https://github.com/TheBrainBro/brainbro), a self-hosted second brain, on umbrelOS.

## Install

1. In umbrelOS, open the **App Store**, then the **⋯** menu, **Community App Stores**.
2. Paste `https://github.com/TheBrainBro/brainbro-umbrel-app` and click **Add**.
3. Open the **BrainBro App Store** and install **BrainBro**.
4. Open BrainBro and sign in as `umbrel`, with the password shown on the app's page in
   umbrelOS.

To reach it from outside your network, for example through a Cloudflare Tunnel, see
[Public address](https://github.com/TheBrainBro/brainbro/blob/main/docs/deployment.md#public-address).

## Updating to a new BrainBro release

1. Get the digests of the new images:

   ```bash
   docker buildx imagetools inspect ghcr.io/thebrainbro/brainbro:X.Y.Z
   docker buildx imagetools inspect ghcr.io/thebrainbro/brainbro-embedder:X.Y.Z
   ```

2. In `brainbro-app/docker-compose.yml`, pin every BrainBro image (`x-app`, `permissions`
   and `embedder`) to `X.Y.Z@sha256:<digest>`.
3. In `brainbro-app/umbrel-app.yml`, change `version`.

umbrelOS offers the update once the change is on `main`: it compares `version` with the
installed one. A change to the package alone, with the same BrainBro version, adds a suffix
(`1.0.0-1`, `1.0.0-2`...) so it is offered too.

## License

AGPL-3.0, as BrainBro.
