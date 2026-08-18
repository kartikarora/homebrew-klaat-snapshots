class KlaatSnapshot < Formula
  desc "Klaat snapshot build - 1.2.0.34-a5b0725e"
  homepage "https://klaat.kartikarora.me"
  version "1.2.0.34-a5b0725e"

  # Default URL (macOS ARM64) to satisfy Homebrew's static parsing requirement
  url "https://distribute.kartikarora.me/bin/klaat/snapshot/1.2.0.34-a5b0725e/klaat-snapshot-macos-arm64-1.2.0.34-a5b0725e"
  sha256 "92d03bd72391025591c3bec05a9c733943952e56139c3de88158c9bd936ecf43"

  if OS.linux?
    if Hardware::CPU.arm?
      url "https://distribute.kartikarora.me/bin/klaat/snapshot/1.2.0.34-a5b0725e/klaat-snapshot-linux-arm64-1.2.0.34-a5b0725e"
      sha256 "6354ce2572f2c47643ff36f7f83c64efc54b2281f19d460dde29a4c5599bd333"
    elsif Hardware::CPU.intel?
      url "https://distribute.kartikarora.me/bin/klaat/snapshot/1.2.0.34-a5b0725e/klaat-snapshot-linux-x64-1.2.0.34-a5b0725e"
      sha256 "527468d5630cb53dfc316a60cb0023fa72aa783cec89045701249f7afc30ab9a"
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
