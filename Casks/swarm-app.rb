cask "swarm-app" do
  version "0.4.2"
  sha256 "9cbb3a1d94699bd8330b7c67621a4bb1faba3a43eccfa3888ced60c662077a61"

  url "https://github.com/PriyanshuUpadhyay/swarm/releases/download/v#{version}/Swarm-#{version}.dmg"
  name "Swarm"
  desc "Chat app for a tree of agent CLIs"
  homepage "https://github.com/PriyanshuUpadhyay/swarm"

  depends_on formula: "priyanshuupadhyay/tap/swarm"
  depends_on macos: :tahoe

  app "Swarm.app"

  caveats <<~EOS
    Swarm is not notarized by Apple, so macOS blocks its first launch. Allow it once:
      1. Open Swarm from Applications. When macOS says it cannot verify the app, click Done.
      2. Open System Settings > Privacy & Security and scroll to Security.
      3. Next to "Swarm was blocked", click Open Anyway and confirm with your password.
    If Open Anyway does not show, run:
      xattr -dr com.apple.quarantine /Applications/Swarm.app
  EOS
end
