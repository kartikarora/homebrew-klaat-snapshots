class KlaatSnapshot < Formula
  desc "Klaat snapshot build - 2.0.0.36-96f9efb3"
  homepage "https://klaat.kartikarora.me"
  version "2.0.0.36-96f9efb3"

  # Default URL (macOS ARM64) to satisfy Homebrew's static parsing requirement
  url "https://distribute.kartikarora.me/bin/klaat/snapshot/2.0.0.36-96f9efb3/klaat-snapshot-macos-arm64-2.0.0.36-96f9efb3"
  sha256 "0d2ca737b70449053f3ed3a853eeedf99bff0546e6848759b65999eaa804b8a2"

  if OS.linux?
    if Hardware::CPU.arm?
      url "https://distribute.kartikarora.me/bin/klaat/snapshot/2.0.0.36-96f9efb3/klaat-snapshot-linux-arm64-2.0.0.36-96f9efb3"
      sha256 "fd534eede03b94f0e2e4bb170bfc87abe7b4824c58b50146a13642e6b4cc4ecb"
    elsif Hardware::CPU.intel?
      url "https://distribute.kartikarora.me/bin/klaat/snapshot/2.0.0.36-96f9efb3/klaat-snapshot-linux-x64-2.0.0.36-96f9efb3"
      sha256 "77626dde8b7828a60435fda6ac395588c21c973281e3cf09e53daec1736490e1"
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
