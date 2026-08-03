class KlaatSnapshot < Formula
  desc "Klaat snapshot build - 1.2.0.27-449fbf0b"
  homepage "https://klaat.kartikarora.me"
  version "1.2.0.27-449fbf0b"

  # Default URL (macOS ARM64) to satisfy Homebrew's static parsing requirement
  url "https://distribute.kartikarora.me/bin/klaat/snapshot/1.2.0.27-449fbf0b/klaat-snapshot-macos-arm64-1.2.0.27-449fbf0b"
  sha256 "6732866adc79ad9938854475666541e1cf0bd6676e3f34e1cc7cb3b1ef3b74de"

  if OS.linux?
    if Hardware::CPU.arm?
      url "https://distribute.kartikarora.me/bin/klaat/snapshot/1.2.0.27-449fbf0b/klaat-snapshot-linux-arm64-1.2.0.27-449fbf0b"
      sha256 "a349faa3f32891a864e8357c22001a39a578c89f602bff80c41dbbbdced7386c"
    elsif Hardware::CPU.intel?
      url "https://distribute.kartikarora.me/bin/klaat/snapshot/1.2.0.27-449fbf0b/klaat-snapshot-linux-x64-1.2.0.27-449fbf0b"
      sha256 "af0e9d197ecbdd3c74858db4e27def45ff0c2751302b5ce3c38ad3da5bcabddc"
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
