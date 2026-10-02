class Yelo < Formula
  desc "Claude and Codex account profiles and a local usage HUD for macOS"
  homepage "https://github.com/PriyanshuUpadhyay/yelo"
  url "https://github.com/PriyanshuUpadhyay/yelo/archive/refs/tags/v0.9.0.tar.gz"
  sha256 "216cff95d1d594e4f619e600f869577bae152c8014f2c07c2c584927626a32af"
  license "MIT"
  head "https://github.com/PriyanshuUpadhyay/yelo.git", branch: "main"

  depends_on "rust" => :build
  depends_on macos: :sonoma # UsageHUD targets macOS 14
  # `swift build` comes with the Xcode Command Line Tools, which Homebrew already requires.

  def install
    system "cargo", "install", *std_cargo_args(root: libexec)
    package = buildpath/"apps/UsageHUD"
    # Homebrew's sandbox and SwiftPM's do not nest.
    system "swift", "build", "--disable-sandbox", "-c", "release", "--package-path", package
    # yelo's own bundle assembly (Info.plist, ad-hoc codesign, atomic swap) into the Cellar:
    # #{prefix}/Applications/UsageHUD.app. `yelo hud install` copies it to ~/Applications.
    system libexec/"bin/yelo", "hud", "assemble", prefix, package
    (bin/"yelo").write_env_script libexec/"bin/yelo",
                                  YELO_BIN:        opt_bin/"yelo",
                                  YELO_HUD_BUNDLE: opt_prefix/"Applications/UsageHUD.app"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/yelo --version")
  end
end
