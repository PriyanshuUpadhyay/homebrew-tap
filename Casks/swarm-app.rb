cask "swarm-app" do
  version "0.9.0"
  sha256 "69b15c7c0063a8188ab6dfc6aac7d0e4f4515e7bf0823ccf7edbefae8c2ee69a"

  url "https://github.com/PriyanshuUpadhyay/swarm/releases/download/v#{version}/Swarm-#{version}.dmg"
  name "Swarm"
  desc "Chat app for a tree of agent CLIs"
  homepage "https://github.com/PriyanshuUpadhyay/swarm"

  # The cask owns the CLI link, so one upgrade moves the app and `swarm` together (ADR 0048).
  depends_on formula: "tmux"
  depends_on macos: :tahoe

  app "Swarm.app"
  binary "#{appdir}/Swarm.app/Contents/Helpers/swarm"

  caveats <<~EOS
    Swarm is not notarized by Apple, so macOS blocks its first launch. Allow it once:
      1. Open Swarm from Applications. When macOS says it cannot verify the app, click Done.
      2. Open System Settings > Privacy & Security and scroll to Security.
      3. Next to "Swarm was blocked", click Open Anyway and confirm with your password.
    If Open Anyway does not show, run:
      xattr -dr com.apple.quarantine /Applications/Swarm.app
  EOS
end
