class KlaatSnapshot < Formula
  desc "Klaat snapshot build - 1.2.0.29-44d4bd21"
  homepage "https://klaat.kartikarora.me"
  version "1.2.0.29-44d4bd21"

  # Default URL (macOS ARM64) to satisfy Homebrew's static parsing requirement
  url "https://distribute.kartikarora.me/bin/klaat/snapshot/1.2.0.29-44d4bd21/klaat-snapshot-macos-arm64-1.2.0.29-44d4bd21"
  sha256 "c5dbea873f30faff6f7cd7f484a88cf75bda671c7ff155f1c0e25d0249b44458"

  if OS.linux?
    if Hardware::CPU.arm?
      url "https://distribute.kartikarora.me/bin/klaat/snapshot/1.2.0.29-44d4bd21/klaat-snapshot-linux-arm64-1.2.0.29-44d4bd21"
      sha256 "8c32bec7262d2c70aeadb94da77626ceb467b5ea57e875e27d392428fa16219f"
    elsif Hardware::CPU.intel?
      url "https://distribute.kartikarora.me/bin/klaat/snapshot/1.2.0.29-44d4bd21/klaat-snapshot-linux-x64-1.2.0.29-44d4bd21"
      sha256 "f8cfdd9cb6149d66274a885ea271602dc513580ee67fea2a5e5afa427849f061"
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
