class KlaatSnapshot < Formula
  desc "Klaat snapshot build - 1.2.0.26-7fe31ad0"
  homepage "https://klaat.kartikarora.me"
  version "1.2.0.26-7fe31ad0"

  # Default URL (macOS ARM64) to satisfy Homebrew's static parsing requirement
  url "https://distribute.kartikarora.me/bin/klaat/snapshot/1.2.0.26-7fe31ad0/klaat-snapshot-macos-arm64-1.2.0.26-7fe31ad0"
  sha256 "e45ee9487b07407250446248b5b126a5bd877010899625a55ebc3d10bbfa9093"

  if OS.linux?
    if Hardware::CPU.arm?
      url "https://distribute.kartikarora.me/bin/klaat/snapshot/1.2.0.26-7fe31ad0/klaat-snapshot-linux-arm64-1.2.0.26-7fe31ad0"
      sha256 "9aaa50e17696786b9a6d0dbe08ffeece3e1218f29336d4ab58039873f1fce464"
    elsif Hardware::CPU.intel?
      url "https://distribute.kartikarora.me/bin/klaat/snapshot/1.2.0.26-7fe31ad0/klaat-snapshot-linux-x64-1.2.0.26-7fe31ad0"
      sha256 "958b19760b7e35eb76a0d23f4df0fcf4334512a7811509640301bb1abed96c26"
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
