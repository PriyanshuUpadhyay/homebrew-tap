class Swarm < Formula
  desc "Message bus and pane control for a tree of agent CLIs"
  homepage "https://github.com/PriyanshuUpadhyay/swarm"
  url "https://github.com/PriyanshuUpadhyay/swarm/releases/download/v0.0.20/swarm-0.0.20-macos-arm64.tar.gz"
  sha256 "079b5a46866fd1203d2df845687eeadc35e07c103289b3febd4af8e942c7f70f"
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
