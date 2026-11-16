class Swarm < Formula
  desc "Message bus and pane control for a tree of agent CLIs"
  homepage "https://github.com/PriyanshuUpadhyay/swarm"
  url "https://github.com/PriyanshuUpadhyay/swarm/releases/download/v0.0.66/swarm-0.0.66-macos-arm64.tar.gz"
  sha256 "c775d672479b9c79c2472df212df4399726637d9f01ea453aa40477642410b06"
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
