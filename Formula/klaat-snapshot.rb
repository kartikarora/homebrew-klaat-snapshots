class KlaatSnapshot < Formula
  desc "Klaat snapshot build - 1.1.0.25-b7055c17"
  homepage "https://klaat.kartikarora.me"
  version "1.1.0.25-b7055c17"

  # Default URL (macOS ARM64) to satisfy Homebrew's static parsing requirement
  url "https://distribute.kartikarora.me/bin/klaat/snapshot/1.1.0.25-b7055c17/klaat-snapshot-macos-arm64-1.1.0.25-b7055c17"
  sha256 "221a8b0d64c20a6b9b471c070dede2ed0b40bc03e200dbcefd85bf7f7485458a"

  if OS.linux?
    if Hardware::CPU.arm?
      url "https://distribute.kartikarora.me/bin/klaat/snapshot/1.1.0.25-b7055c17/klaat-snapshot-linux-arm64-1.1.0.25-b7055c17"
      sha256 "d99d592187aaca518b45ec42d3f14c11c3e46701aeb2f64b93168296d6d0d710"
    elsif Hardware::CPU.intel?
      url "https://distribute.kartikarora.me/bin/klaat/snapshot/1.1.0.25-b7055c17/klaat-snapshot-linux-x64-1.1.0.25-b7055c17"
      sha256 "0a76f75d89adfa3ffbd4f4c1dc9e3418b73ae3f164e295982f23d0055753b7bd"
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
