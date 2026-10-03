cask "swarm-app" do
  version "0.7.0"
  sha256 "5bf12f4c742250607887d97c3692ac1de1194a70bb4ec9fc1d3d0feeef3fce69"

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
