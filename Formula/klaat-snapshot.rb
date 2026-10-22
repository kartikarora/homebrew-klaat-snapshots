class KlaatSnapshot < Formula
  desc "Klaat snapshot build - 2.1.0.39-9062ea4a"
  homepage "https://klaat.kartikarora.me"
  version "2.1.0.39-9062ea4a"

  # Default URL (macOS ARM64) to satisfy Homebrew's static parsing requirement
  url "https://distribute.kartikarora.me/bin/klaat/snapshot/2.1.0.39-9062ea4a/klaat-snapshot-macos-arm64-2.1.0.39-9062ea4a"
  sha256 "6516eb96403913ac14fb8402cbebbe58139bd4b0a179e29ef4f2bb1bb3b92965"

  if OS.linux?
    if Hardware::CPU.arm?
      url "https://distribute.kartikarora.me/bin/klaat/snapshot/2.1.0.39-9062ea4a/klaat-snapshot-linux-arm64-2.1.0.39-9062ea4a"
      sha256 "d4ab9b5a1d384dab57a071204f8813b770721499c0a72c91fa0e05eb29a76821"
    elsif Hardware::CPU.intel?
      url "https://distribute.kartikarora.me/bin/klaat/snapshot/2.1.0.39-9062ea4a/klaat-snapshot-linux-x64-2.1.0.39-9062ea4a"
      sha256 "afea545fadcda5f99e3350c8ba5a302b88b199db453ec01ad4e8a1e14d33e7c4"
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
