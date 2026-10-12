class Swarm < Formula
  desc "Moved: the swarm-app cask installs the swarm CLI"
  homepage "https://github.com/PriyanshuUpadhyay/swarm"
  url "https://github.com/PriyanshuUpadhyay/swarm/archive/refs/tags/v0.9.1.tar.gz"
  sha256 "239912517a521b8f935ec59b9eb63bc6851958a0f12b7d3744f613d5d5bba9e6"
  license "MIT"

  deprecate! date: "2026-10-12", because: "is installed by the swarm-app cask",
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

  test do
    assert_path_exists pkgshare/"MOVED"
  end
end
