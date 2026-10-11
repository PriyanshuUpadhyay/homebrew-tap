class Swarm < Formula
  desc "Moved: the swarm-app cask installs the swarm CLI"
  homepage "https://github.com/PriyanshuUpadhyay/swarm"
  url "https://github.com/PriyanshuUpadhyay/swarm/archive/refs/tags/v0.9.0.tar.gz"
  sha256 "6cbc224789b9bc0ceaa760b9b19543fc953d233c9a23b5be223579511d7844a4"
  license "MIT"

  deprecate! date: "2026-10-11", because: "is installed by the swarm-app cask",
             replacement_cask: "priyanshuupadhyay/tap/swarm-app"

  def install
    # A keg must hold one file.
    (pkgshare/"MOVED").write "swarm now ships inside Swarm.app; see the swarm-app cask.\n"
  end

  def caveats
    <<~EOS
      swarm now ships inside Swarm.app. Run this once to link it onto PATH:
        brew update && brew upgrade priyanshuupadhyay/tap/swarm; brew reinstall --cask --force priyanshuupadhyay/tap/swarm-app
    EOS
  end
end
