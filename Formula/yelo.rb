class Yelo < Formula
  include Language::Python::Virtualenv

  desc "Claude and Codex account profiles and a local usage HUD for macOS"
  homepage "https://github.com/PriyanshuUpadhyay/yelo"
  url "https://github.com/PriyanshuUpadhyay/yelo/archive/refs/tags/v0.5.2.tar.gz"
  sha256 "2eaf2e4acd992fcdfe41927cd837fd63747d1e4e7fb593015636a1fe548a3ab3"
  license "MIT"
  head "https://github.com/PriyanshuUpadhyay/yelo.git", branch: "main"

  # yelo builds with the uv_build backend, and Homebrew's pip is pinned to `--no-binary=:all:`.
  # uv carries that backend inside itself, so it builds the wheel with no PyPI round trip; pip
  # then installs the finished pure-Python wheel, which that flag does allow.
  depends_on "uv" => :build
  depends_on macos: :sonoma # UsageHUD targets macOS 14
  depends_on "python@3.13"
  # `swift build` comes with the Xcode Command Line Tools, which Homebrew already requires.

  def install
    venv = virtualenv_create(libexec, "python3.13")
    system "uv", "build", "--wheel", "--offline", "--out-dir", buildpath/"dist",
           "--python", libexec/"bin/python"
    venv.pip_install buildpath/"dist/yelo-#{version}-py3-none-any.whl"
    package = buildpath/"apps/UsageHUD"
    # Homebrew's sandbox and SwiftPM's do not nest.
    system "swift", "build", "--disable-sandbox", "-c", "release", "--package-path", package
    # yelo's own bundle assembly (Info.plist, ad-hoc codesign, atomic swap) into the Cellar:
    # #{prefix}/Applications/UsageHUD.app. `yelo hud install` copies it to ~/Applications.
    system libexec/"bin/python", "-c",
           "from yelo import hud; hud.assemble_bundle('#{prefix}', '#{package}')"
    (bin/"yelo").write_env_script libexec/"bin/yelo",
                                  YELO_BIN:        opt_bin/"yelo",
                                  YELO_HUD_BUNDLE: opt_prefix/"Applications/UsageHUD.app"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/yelo --version")
  end
end
