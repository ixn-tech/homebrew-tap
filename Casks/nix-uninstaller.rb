cask "nix-uninstaller" do
  version "1.0.1"
  sha256 "efde24b7f9816c55e69b8315c330f23c80eeb174f78f4d16086b2c3c3411b903"

  url "https://github.com/ixn-tech/Nix-the-mac-uninstaller/releases/download/v#{version}/Nix.dmg",
      verified: "github.com/ixn-tech/Nix-the-mac-uninstaller/"
  name "Nix"
  desc "Uninstaller that finds and removes the leftover files apps leave behind"
  homepage "https://www.ideaxecution.com/nix-mac-uninstaller/"

  livecheck do
    url :url
    strategy :github_latest
  end

  auto_updates true
  depends_on macos: ">= :sonoma"

  app "Nix.app"

  zap trash: [
    "~/Library/Application Support/Nix",
    "~/Library/Caches/com.ideaxecution.nix-it",
    "~/Library/HTTPStorages/com.ideaxecution.nix-it",
    "~/Library/Preferences/com.ideaxecution.nix-it.plist",
    "~/Library/Saved Application State/com.ideaxecution.nix-it.savedState",
  ]
end
