class Swarm < Formula
  desc "Message bus and pane control for a tree of agent CLIs"
  homepage "https://github.com/PriyanshuUpadhyay/swarm"
  url "https://github.com/PriyanshuUpadhyay/swarm/archive/refs/tags/v0.4.4.tar.gz"
  sha256 "d96f8f4514ce5fd78554011b46ca4d88fe3c81f7b229ebf2ae08b5516d15036c"
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
