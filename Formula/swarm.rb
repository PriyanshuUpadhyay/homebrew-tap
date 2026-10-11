class Swarm < Formula
  desc "Message bus and pane control for a tree of agent CLIs"
  homepage "https://github.com/PriyanshuUpadhyay/swarm"
  url "https://github.com/PriyanshuUpadhyay/swarm/archive/refs/tags/v0.9.0.tar.gz"
  sha256 "6cbc224789b9bc0ceaa760b9b19543fc953d233c9a23b5be223579511d7844a4"
  license "MIT"

  # A pointer for one release: `brew upgrade` moves formulae first, so this frees bin/swarm
  # before the swarm-app cask links its own copy (ADR 0048). The next release removes it.
  deprecate! date:             "2026-10-11",
             because:          "the swarm-app cask installs the swarm CLI with the app",
             replacement_cask: "swarm-app"

  def install
    doc.install "README.md"
  end

  test do
    assert_path_exists doc/"README.md"
  end
end
