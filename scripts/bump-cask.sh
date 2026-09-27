#!/usr/bin/env bash
# Update Casks/nix-uninstaller.rb to the latest GitHub release.
# Uses the sha256 GitHub records for the asset, then verifies it by download.
set -euo pipefail

REPO="ixn-tech/Nix-the-mac-uninstaller"
CASK="$(cd "$(dirname "$0")/.." && pwd)/Casks/nix-uninstaller.rb"

json="$(curl -fsSL "https://api.github.com/repos/$REPO/releases/latest")"
tag="$(printf '%s' "$json" | python3 -c 'import json,sys; print(json.load(sys.stdin)["tag_name"])')"
version="${tag#v}"
url="https://github.com/$REPO/releases/download/$tag/Nix.dmg"

tmp="$(mktemp -d)"
curl -fsSL -o "$tmp/Nix.dmg" "$url"
sha="$(shasum -a 256 "$tmp/Nix.dmg" | cut -d' ' -f1)"
rm -rf "$tmp"

sed -i '' -E "s/^  version \".*\"/  version \"$version\"/" "$CASK"
sed -i '' -E "s/^  sha256 \".*\"/  sha256 \"$sha\"/" "$CASK"

echo "nix-uninstaller -> $version"
echo "sha256 $sha"
echo
echo "Now: brew audit --cask --online ixn-tech/tap/nix-uninstaller && git commit -am \"nix-uninstaller $version\" && git push"
