class KlaatSnapshot < Formula
  desc "Klaat snapshot build - 1.2.0.30-948ded73"
  homepage "https://klaat.kartikarora.me"
  version "1.2.0.30-948ded73"

  # Default URL (macOS ARM64) to satisfy Homebrew's static parsing requirement
  url "https://distribute.kartikarora.me/bin/klaat/snapshot/1.2.0.30-948ded73/klaat-snapshot-macos-arm64-1.2.0.30-948ded73"
  sha256 "861489e34f5796dddb2c3d5e9eea8bf96008d63c5c16baebef81d34996cc4b31"

  if OS.linux?
    if Hardware::CPU.arm?
      url "https://distribute.kartikarora.me/bin/klaat/snapshot/1.2.0.30-948ded73/klaat-snapshot-linux-arm64-1.2.0.30-948ded73"
      sha256 "217d3c23e61dde73fb01a3f4d326fc9a7525a010810915a5755d654b49915d04"
    elsif Hardware::CPU.intel?
      url "https://distribute.kartikarora.me/bin/klaat/snapshot/1.2.0.30-948ded73/klaat-snapshot-linux-x64-1.2.0.30-948ded73"
      sha256 "1d31bc258113a004a7db156070c94f9b171999ecf0ac495eb301d1722b212b37"
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
