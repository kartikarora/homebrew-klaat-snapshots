class KlaatSnapshot < Formula
  desc "Klaat snapshot build - 1.2.0.35-2b20dfc5"
  homepage "https://klaat.kartikarora.me"
  version "1.2.0.35-2b20dfc5"

  # Default URL (macOS ARM64) to satisfy Homebrew's static parsing requirement
  url "https://distribute.kartikarora.me/bin/klaat/snapshot/1.2.0.35-2b20dfc5/klaat-snapshot-macos-arm64-1.2.0.35-2b20dfc5"
  sha256 "00c8d79ef71a7ef7dc67893f288a30fdb8c7b569743cb7ac872fc334e0c11a16"

  if OS.linux?
    if Hardware::CPU.arm?
      url "https://distribute.kartikarora.me/bin/klaat/snapshot/1.2.0.35-2b20dfc5/klaat-snapshot-linux-arm64-1.2.0.35-2b20dfc5"
      sha256 "bbce7867d027982f0c58140bbe467964d8e3ebaf7b49a3e969321345e1c48444"
    elsif Hardware::CPU.intel?
      url "https://distribute.kartikarora.me/bin/klaat/snapshot/1.2.0.35-2b20dfc5/klaat-snapshot-linux-x64-1.2.0.35-2b20dfc5"
      sha256 "20e051ef045f62da2dfbf55b4cfe99fa462b96e4fc7711fe10aa386367cf450d"
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
