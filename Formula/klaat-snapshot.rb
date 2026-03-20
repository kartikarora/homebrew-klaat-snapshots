class KlaatSnapshot < Formula
  desc "Klaat snapshot build - 0.2.0.20-2aa8c697"
  homepage "https://klaat.kartikarora.me"
  version "0.2.0.20-2aa8c697"

  if OS.mac? && Hardware::CPU.arm?
    url "https://distribute.kartikarora.me/bin/klaat/snapshot/0.2.0.20-2aa8c697/klaat-snapshot-macos-arm64-0.2.0.20-2aa8c697"
    sha256 "8a0da73db69d9b16ce665e8fbedafb89ee487e3e0ecaeb696ddd5999a8b89546"
  elsif OS.linux? && Hardware::CPU.arm?
    url "https://distribute.kartikarora.me/bin/klaat/snapshot/0.2.0.20-2aa8c697/klaat-snapshot-linux-arm64-0.2.0.20-2aa8c697"
    sha256 "f6635760a0453320240872c0c940eeaf180a38863dbae83de611dc077dbda92f"
  elsif OS.linux? && Hardware::CPU.intel?
    url "https://distribute.kartikarora.me/bin/klaat/snapshot/0.2.0.20-2aa8c697/klaat-snapshot-linux-x64-0.2.0.20-2aa8c697"
    sha256 "89d2774d5caa9124a0954fe3947ad22683cdeda6f2a7fefd8a67d8393c2a3946"
  end

  def install
    bin.install Dir["klaat-*"].first => "klaat-snapshot"
  end

  test do
    assert_match "klaat", shell_output("#{bin}/klaat-snapshot --help")
  end
end
