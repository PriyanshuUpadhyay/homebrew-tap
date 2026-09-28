class Swarm < Formula
  desc "Message bus and pane control for a tree of agent CLIs"
  homepage "https://github.com/PriyanshuUpadhyay/swarm"
  url "https://github.com/PriyanshuUpadhyay/swarm/archive/refs/tags/v0.1.0.tar.gz"
  sha256 "8d689a95d4ab157f97a6f7ba247ff8537640190b563311cd86094f235619f7ef"
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
