class KlaatSnapshot < Formula
  desc "Klaat snapshot build - 2.0.0.37-b12beda8"
  homepage "https://klaat.kartikarora.me"
  version "2.0.0.37-b12beda8"

  # Default URL (macOS ARM64) to satisfy Homebrew's static parsing requirement
  url "https://distribute.kartikarora.me/bin/klaat/snapshot/2.0.0.37-b12beda8/klaat-snapshot-macos-arm64-2.0.0.37-b12beda8"
  sha256 "3b589a129938d24f527a5a0d77d99791aed5f9d6609d1859eab0568aa42121a2"

  if OS.linux?
    if Hardware::CPU.arm?
      url "https://distribute.kartikarora.me/bin/klaat/snapshot/2.0.0.37-b12beda8/klaat-snapshot-linux-arm64-2.0.0.37-b12beda8"
      sha256 "ee4a99f15b294477688dc749e2c6bf41044896b14f9088d53c2ab2768c6687cf"
    elsif Hardware::CPU.intel?
      url "https://distribute.kartikarora.me/bin/klaat/snapshot/2.0.0.37-b12beda8/klaat-snapshot-linux-x64-2.0.0.37-b12beda8"
      sha256 "296e6fec9422fe49ad09355cbd5f2e5bcf552c4ce5e1805ee3b3563d87bfba7e"
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
