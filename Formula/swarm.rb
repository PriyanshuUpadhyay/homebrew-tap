class Swarm < Formula
  desc "Message bus and pane control for a tree of agent CLIs"
  homepage "https://github.com/PriyanshuUpadhyay/swarm"
  url "https://github.com/PriyanshuUpadhyay/swarm/archive/refs/tags/v0.4.3.tar.gz"
  sha256 "6a7df98b56ce327e26d4283c8dbf8fc6a93397eb78a5a813b0c7bcc8e6fa0e9d"
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
