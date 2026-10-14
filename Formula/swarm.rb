class Swarm < Formula
  desc "Message bus and pane control for a tree of agent CLIs"
  homepage "https://github.com/PriyanshuUpadhyay/swarm"
  url "https://github.com/PriyanshuUpadhyay/swarm/releases/download/v0.0.6/swarm-0.0.6-macos-arm64.tar.gz"
  sha256 "9084b235e9f4803a6368cd00bf0d5c95729728fd534c15b6cdad09dd460f81b2"
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
