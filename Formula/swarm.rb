class Swarm < Formula
  desc "Message bus and pane control for a tree of agent CLIs"
  homepage "https://github.com/PriyanshuUpadhyay/swarm"
  url "https://github.com/PriyanshuUpadhyay/swarm/archive/refs/tags/v0.4.0.tar.gz"
  sha256 "78170344b0f36ffb0210f98620af63dd6aff2d70f74b1dc875455d282741ef84"
  license "MIT"
  head "https://github.com/PriyanshuUpadhyay/swarm.git", branch: "main"

  depends_on "rust" => :build
  depends_on "tmux" # the default pane host

  def install
    system "cargo", "install", *std_cargo_args
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/swarm --version")
  end
end
