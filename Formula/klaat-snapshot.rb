class KlaatSnapshot < Formula
  desc "Klaat snapshot build - 1.2.0.31-fa7d3cad"
  homepage "https://klaat.kartikarora.me"
  version "1.2.0.31-fa7d3cad"

  # Default URL (macOS ARM64) to satisfy Homebrew's static parsing requirement
  url "https://distribute.kartikarora.me/bin/klaat/snapshot/1.2.0.31-fa7d3cad/klaat-snapshot-macos-arm64-1.2.0.31-fa7d3cad"
  sha256 "e91ec09e5a1deb40ebc55db8d68e9116b7695cacd6061a95e28d93457d98e4aa"

  if OS.linux?
    if Hardware::CPU.arm?
      url "https://distribute.kartikarora.me/bin/klaat/snapshot/1.2.0.31-fa7d3cad/klaat-snapshot-linux-arm64-1.2.0.31-fa7d3cad"
      sha256 "b62498d608b3cecdcdc36dacb2d040a111a578bca63219656448d52ec90665c0"
    elsif Hardware::CPU.intel?
      url "https://distribute.kartikarora.me/bin/klaat/snapshot/1.2.0.31-fa7d3cad/klaat-snapshot-linux-x64-1.2.0.31-fa7d3cad"
      sha256 "b30b4a97b285d3e092477d1c2f046c2f0ab7bfff4f30675dc47af44a9a98c22f"
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
