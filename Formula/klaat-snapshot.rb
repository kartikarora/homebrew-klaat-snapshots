class KlaatSnapshot < Formula
  desc "Klaat snapshot build - 2.1.0.41-b17006e9"
  homepage "https://klaat.kartikarora.me"
  version "2.1.0.41-b17006e9"

  # Default URL (macOS ARM64) to satisfy Homebrew's static parsing requirement
  url "https://distribute.kartikarora.me/bin/klaat/snapshot/2.1.0.41-b17006e9/klaat-snapshot-macos-arm64-2.1.0.41-b17006e9"
  sha256 "6bab97b5cecf4c5999042ce9392becf7c14d560ebfa372f391e5308d06acaf08"

  if OS.linux?
    if Hardware::CPU.arm?
      url "https://distribute.kartikarora.me/bin/klaat/snapshot/2.1.0.41-b17006e9/klaat-snapshot-linux-arm64-2.1.0.41-b17006e9"
      sha256 "5a15dffb81517b9e94f58d7c7632f954fa21973ecb33f41f6f8404c3ad9736ac"
    elsif Hardware::CPU.intel?
      url "https://distribute.kartikarora.me/bin/klaat/snapshot/2.1.0.41-b17006e9/klaat-snapshot-linux-x64-2.1.0.41-b17006e9"
      sha256 "103329e448470505bd982865f42eff82f3f3d34b39147a85a9ed9eabca30042b"
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
