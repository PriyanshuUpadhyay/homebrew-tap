class Swarm < Formula
  desc "Message bus and pane control for a tree of agent CLIs"
  homepage "https://github.com/PriyanshuUpadhyay/swarm"
  url "https://github.com/PriyanshuUpadhyay/swarm/releases/download/v0.0.11/swarm-0.0.11-macos-arm64.tar.gz"
  sha256 "306e69f5fd3d16a6b066a6be248645201a5ad809debd6db3eaf1bb96e417c70c"
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
