# Ideaxecution Homebrew tap

Homebrew casks for apps by [Ideaxecution Technologies](https://www.ideaxecution.com).

## Nix - Mac app uninstaller

```bash
brew install --cask ixn-tech/tap/nix-uninstaller
```

Nix removes an app together with the leftover caches, preferences, logs, support
files and launch agents that dragging to the Trash leaves behind, and shows how
much space you got back. Free to scan every app; Nix Pro is a one-time purchase.

- Product page: https://www.ideaxecution.com/nix-mac-uninstaller/
- Requires macOS 14 Sonoma or later. Universal (Apple Silicon and Intel).
- Signed with Developer ID and notarized by Apple.

To remove Nix and everything it stored:

```bash
brew uninstall --zap --cask nix-uninstaller
```

## Maintaining this tap

Casks live in `Casks/`. Homebrew 6 and later asks users to trust third-party
taps; the fully qualified `brew install --cask ixn-tech/tap/<name>` form trusts
just that cask, which is why the install line above uses it.

After every Nix release, update the cask in one step:

```bash
scripts/bump-cask.sh          # reads the latest GitHub release, rewrites version + sha256
git commit -am "nix-uninstaller <version>" && git push
```

Or by hand:

```bash
brew bump-cask-pr --version <new> --no-fork --tap ixn-tech/tap nix-uninstaller
```

The `livecheck` block follows GitHub releases. Once the Sparkle feed at
`https://nix.ideaxecution.com/updates/appcast.xml` is live, switch it to
`strategy :sparkle` so `brew livecheck` reads the same feed the app does.
