class FastTrackpad < Formula
  desc "Reversible macOS tuning for rechargeable Apple Magic Trackpads"
  homepage "https://github.com/lattecor/fast-trackpad"
  url "https://github.com/lattecor/fast-trackpad/releases/download/v0.1.0/fast-trackpad-0.1.0.tar.gz"
  version "0.1.0"
  sha256 "4b4c11e23e1eafd02b5745dc1a1e7fb7c4525b23e8b40a9b665ce7f9988ca5d4"
  license "MIT"

  depends_on macos: :sequoia
  uses_from_macos "swift" => :build

  def install
    # Swift 6 and the macOS SDK come from current Xcode Command Line Tools or Xcode.
    # Installation builds files only; it never changes a trackpad setting.
    system "./build.sh"
    libexec.install "build/Fast Trackpad.app"
    bin.install "bin/fast-trackpad"
  end

  def caveats
    <<~EOS
      Open the GUI with: fast-trackpad gui
      Device and private-API compatibility is checked separately at runtime.
      Installing or upgrading this formula does not apply tuning.
    EOS
  end

end
