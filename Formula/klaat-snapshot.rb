class KlaatSnapshot < Formula
  desc "Klaat snapshot build - 1.2.0.28-705f2a0d"
  homepage "https://klaat.kartikarora.me"
  version "1.2.0.28-705f2a0d"

  # Default URL (macOS ARM64) to satisfy Homebrew's static parsing requirement
  url "https://distribute.kartikarora.me/bin/klaat/snapshot/1.2.0.28-705f2a0d/klaat-snapshot-macos-arm64-1.2.0.28-705f2a0d"
  sha256 "d8ab20b1c8b03334e06ad90e1195bf0419fce2d8891eddc6243ffa3f67327152"

  if OS.linux?
    if Hardware::CPU.arm?
      url "https://distribute.kartikarora.me/bin/klaat/snapshot/1.2.0.28-705f2a0d/klaat-snapshot-linux-arm64-1.2.0.28-705f2a0d"
      sha256 "288477f47ba3819ea25dddb8dd3e97a9f9fa77cb27e192b668af8eafb962c67e"
    elsif Hardware::CPU.intel?
      url "https://distribute.kartikarora.me/bin/klaat/snapshot/1.2.0.28-705f2a0d/klaat-snapshot-linux-x64-1.2.0.28-705f2a0d"
      sha256 "b00566eca09a801e9ed249b6c89cefae7b2345f3a772a5465fb3ca35f1431eac"
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
