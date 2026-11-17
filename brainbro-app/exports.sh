# Secrets derived from the device seed: the same on every start, different on
# every device, and never stored in this repository.
export APP_BRAINBRO_SECRET_KEY="$(derive_entropy "app-${EXPORTS_APP_ID}-secret-key")"
export APP_BRAINBRO_POSTGRES_PASSWORD="$(derive_entropy "app-${EXPORTS_APP_ID}-postgres-password")"
