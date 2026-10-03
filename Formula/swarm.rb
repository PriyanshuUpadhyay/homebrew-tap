class Swarm < Formula
  desc "Message bus and pane control for a tree of agent CLIs"
  homepage "https://github.com/PriyanshuUpadhyay/swarm"
  url "https://github.com/PriyanshuUpadhyay/swarm/archive/refs/tags/v0.7.1.tar.gz"
  sha256 "e6c0a72169a3cd2d1fce57fb84fcfeb1aeca633df9b529811d5d0a4c99ae8d63"
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
