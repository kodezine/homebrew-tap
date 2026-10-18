# kodezine/tap — Homebrew tap

Prebuilt, minisign-signed macOS binaries for Kodezine software. One tap, one
cask per product:

```sh
brew tap kodezine/tap
brew install --cask rustycan      # CANopen viewer (GUI)
```

or fully qualified, without a separate `brew tap`:

```sh
brew install --cask kodezine/tap/rustycan
```

Downloads are served from <https://kodezine.com/downloads/> and signed with
[minisign](https://jedisct1.github.io/minisign/); verify against the Kodezine
public key published on each product page.

## Renamed from `kodezine/rustycan` (2026-10-18)

The tap was renamed to be product-neutral. If you tapped it under the old name,
`brew upgrade` keeps working through GitHub's redirect; to switch to the new
name:

```sh
brew untap kodezine/rustycan && brew tap kodezine/tap
```

## Maintainers

This GitHub repository is a read-only mirror of the primary tap on
`git.kodezine.com`; cask bumps are written there by the release pipelines.
