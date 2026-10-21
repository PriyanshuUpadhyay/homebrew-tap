class Swarm < Formula
  desc "Message bus and pane control for a tree of agent CLIs"
  homepage "https://github.com/PriyanshuUpadhyay/swarm"
  url "https://github.com/PriyanshuUpadhyay/swarm/releases/download/v0.0.27/swarm-0.0.27-macos-arm64.tar.gz"
  sha256 "330057297817b0dc1f109364206071d257d39dac3f79e8991c60fab1be68ada9"
  license "MIT"

  depends_on arch: :arm64
  depends_on macos: :tahoe
  depends_on "tmux"

  def install
    bin.install "bin/swarm"
    libexec.install Dir["libexec/*"]
  end

  test do
    assert_match "swarm #{version}", shell_output("#{bin}/swarm --version")
  end
end
