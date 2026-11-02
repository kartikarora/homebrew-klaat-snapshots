class KlaatSnapshot < Formula
  desc "Klaat snapshot build - 2.1.0.40-1cb93ca2"
  homepage "https://klaat.kartikarora.me"
  version "2.1.0.40-1cb93ca2"

  # Default URL (macOS ARM64) to satisfy Homebrew's static parsing requirement
  url "https://distribute.kartikarora.me/bin/klaat/snapshot/2.1.0.40-1cb93ca2/klaat-snapshot-macos-arm64-2.1.0.40-1cb93ca2"
  sha256 "787ed9555c080db7fdfefacfc6f6763cb0f7a8e6bfc82b97800545c323623734"

  if OS.linux?
    if Hardware::CPU.arm?
      url "https://distribute.kartikarora.me/bin/klaat/snapshot/2.1.0.40-1cb93ca2/klaat-snapshot-linux-arm64-2.1.0.40-1cb93ca2"
      sha256 "f2b008a91e2a3dee0ccabe4bbb406740dfd1cf7a947b464ba6df6f35b402c9f3"
    elsif Hardware::CPU.intel?
      url "https://distribute.kartikarora.me/bin/klaat/snapshot/2.1.0.40-1cb93ca2/klaat-snapshot-linux-x64-2.1.0.40-1cb93ca2"
      sha256 "f1d45947d720fe6ddc6f76290dd3b552952f3044f0ee3ebdb0c4fe61cf4f8e9a"
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
