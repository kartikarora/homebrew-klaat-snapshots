class KlaatSnapshot < Formula
  desc "Klaat snapshot build - 2.1.0.44-bd0cfd4e"
  homepage "https://klaat.kartikarora.me"
  version "2.1.0.44-bd0cfd4e"

  # Default URL (macOS ARM64) to satisfy Homebrew's static parsing requirement
  url "https://distribute.kartikarora.me/bin/klaat/snapshot/2.1.0.44-bd0cfd4e/klaat-snapshot-macos-arm64-2.1.0.44-bd0cfd4e"
  sha256 "4ff62ac65134672c02943b5071835102f23df437f5ece348d323c3d0dbfa0467"

  if OS.linux?
    if Hardware::CPU.arm?
      url "https://distribute.kartikarora.me/bin/klaat/snapshot/2.1.0.44-bd0cfd4e/klaat-snapshot-linux-arm64-2.1.0.44-bd0cfd4e"
      sha256 "759ca843047d292ebbab62e93f5e11abdf1d1437b629d048211991898c7211e8"
    elsif Hardware::CPU.intel?
      url "https://distribute.kartikarora.me/bin/klaat/snapshot/2.1.0.44-bd0cfd4e/klaat-snapshot-linux-x64-2.1.0.44-bd0cfd4e"
      sha256 "8401f6b83b358de303fca3287f7e397135b1d4bbfb8783286bb18402afae20cd"
    end
  end

  def install
    if OS.mac? && Hardware::CPU.intel?
      odie "Klaat only supports Apple Silicon Macs. Intel Macs are not supported."
    end

    bin.install Dir["klaat-*"].first => "klaat-snapshot"
  end

  test do
    assert_match "klaat", shell_output("#{bin}/klaat-snapshot --help")
  end
end
