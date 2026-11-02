class KlaatSnapshot < Formula
  desc "Klaat snapshot build - 2.1.0.45-ec4a5649"
  homepage "https://klaat.kartikarora.me"
  version "2.1.0.45-ec4a5649"

  # Default URL (macOS ARM64) to satisfy Homebrew's static parsing requirement
  url "https://distribute.kartikarora.me/bin/klaat/snapshot/2.1.0.45-ec4a5649/klaat-snapshot-macos-arm64-2.1.0.45-ec4a5649"
  sha256 "955f835e861a3d7a237ab18fb45854de92977d6f434798b256a97c173bba2687"

  if OS.linux?
    if Hardware::CPU.arm?
      url "https://distribute.kartikarora.me/bin/klaat/snapshot/2.1.0.45-ec4a5649/klaat-snapshot-linux-arm64-2.1.0.45-ec4a5649"
      sha256 "e3b62f870379a485569b507fdf1ceca2c0f40922d78d1bd14c5e7b0a8bc8faf8"
    elsif Hardware::CPU.intel?
      url "https://distribute.kartikarora.me/bin/klaat/snapshot/2.1.0.45-ec4a5649/klaat-snapshot-linux-x64-2.1.0.45-ec4a5649"
      sha256 "41b72e81ae06d63c2f48fc5d72faa2426f49eeae46737deead468486f8974290"
    end
  end

  def install
    if OS.mac? && Hardware::CPU.intel?
      odie "Klaat only supports Apple Silicon Macs. Intel Macs are not supported."
    end

    bin.install Dir["klaat-*"].first => "klaat-snapshot"
    generate_completions_from_executable(bin/"klaat-snapshot", "completion")
  end

  test do
    assert_match "klaat", shell_output("#{bin}/klaat-snapshot --help")
  end
end
