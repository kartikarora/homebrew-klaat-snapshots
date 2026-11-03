class KlaatSnapshot < Formula
  desc "Klaat snapshot build - 2.1.0.46-802d7100"
  homepage "https://klaat.kartikarora.me"
  version "2.1.0.46-802d7100"

  # Default URL (macOS ARM64) to satisfy Homebrew's static parsing requirement
  url "https://distribute.kartikarora.me/bin/klaat/snapshot/2.1.0.46-802d7100/klaat-snapshot-macos-arm64-2.1.0.46-802d7100"
  sha256 "04651c372c2fd3a5d85a3ff1f96909c72285310acafd3715b146099ebb144500"

  if OS.linux?
    if Hardware::CPU.arm?
      url "https://distribute.kartikarora.me/bin/klaat/snapshot/2.1.0.46-802d7100/klaat-snapshot-linux-arm64-2.1.0.46-802d7100"
      sha256 "7db1ac66433673d958edb98bcdd7fa01e5679a3b363839212d02c3e4aeb13773"
    elsif Hardware::CPU.intel?
      url "https://distribute.kartikarora.me/bin/klaat/snapshot/2.1.0.46-802d7100/klaat-snapshot-linux-x64-2.1.0.46-802d7100"
      sha256 "e8851d4709dee5cf7428c44c665bb921db0598cb7de5e718197b2973102354ee"
    end
  end

  def install
    if OS.mac? && Hardware::CPU.intel?
      odie "Klaat only supports Apple Silicon Macs. Intel Macs are not supported."
    end

    bin.install Dir["klaat-*"].first => "klaat-snapshot"
    (bin/"klaat-snapshot").chmod 0555
    generate_completions_from_executable(bin/"klaat-snapshot", "completion")
  end

  test do
    assert_match "klaat", shell_output("#{bin}/klaat-snapshot --help")
  end
end
