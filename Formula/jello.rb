class Jello < Formula
  include Language::Python::Virtualenv

  desc "Claude and Codex account profiles and a local usage HUD for macOS"
  homepage "https://github.com/PriyanshuUpadhyay/jello"
  url "https://github.com/PriyanshuUpadhyay/jello/archive/refs/tags/v0.4.0.tar.gz"
  sha256 "cf6351bcbf01e8e8798c53c01707ee3f0ed235940d60fb49924741cbfee89e4d"
  license "MIT"
  head "https://github.com/PriyanshuUpadhyay/jello.git", branch: "main"

  # jello builds with the uv_build backend, and Homebrew's pip is pinned to `--no-binary=:all:`.
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
    venv.pip_install buildpath/"dist/jello-#{version}-py3-none-any.whl"
    package = buildpath/"apps/UsageHUD"
    # Homebrew's sandbox and SwiftPM's do not nest.
    system "swift", "build", "--disable-sandbox", "-c", "release", "--package-path", package
    # jello's own bundle assembly (Info.plist, ad-hoc codesign, atomic swap) into the Cellar:
    # #{prefix}/Applications/UsageHUD.app. `jello hud install` copies it to ~/Applications.
    system libexec/"bin/python", "-c",
           "from jello import hud; hud.assemble_bundle('#{prefix}', '#{package}')"
    (bin/"jello").write_env_script libexec/"bin/jello",
                                   JELLO_BIN:        opt_bin/"jello",
                                   JELLO_HUD_BUNDLE: opt_prefix/"Applications/UsageHUD.app"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/jello --version")
  end
end
