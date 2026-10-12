cask "swarm-app" do
  version "0.9.1"
  sha256 "0cbb5f8401f540f60021025bc644ee1e47bd2afd403f55464318f614f7b0babe"

  url "https://github.com/PriyanshuUpadhyay/swarm/releases/download/v#{version}/Swarm-#{version}.dmg"
  name "Swarm"
  desc "Chat app for a tree of agent CLIs"
  homepage "https://github.com/PriyanshuUpadhyay/swarm"

  depends_on formula: "tmux"
  depends_on macos: :tahoe

  app "Swarm.app"
  binary "#{appdir}/Swarm.app/Contents/Helpers/swarm"

  caveats <<~EOS
    Swarm is not notarized by Apple, so macOS blocks its first launch. Allow it once:
      1. Open Swarm from Applications. When macOS says it cannot verify the app, click Done.
      2. Open System Settings > Privacy & Security and scroll to Security.
      3. Next to "Swarm was blocked", click Open Anyway and confirm with your password.
    If Open Anyway does not show, or macOS blocks the swarm command, run:
      xattr -dr com.apple.quarantine /Applications/Swarm.app
  EOS
end
