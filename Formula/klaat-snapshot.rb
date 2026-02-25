class KlaatSnapshot < Formula
  desc "Klaat snapshot build - 0.1.0-ea2492e9"
  homepage "https://klaat.kartikarora.me"
  version "0.1.0-ea2492e9"

  if OS.mac? && Hardware::CPU.arm?
    url "https://distribute.kartikarora.me/bin/klaat/snapshot/0.1.0-ea2492e9/klaat-snapshot-macos-arm64-0.1.0-ea2492e9"
    sha256 "3208a5bad33771f298c30ffa27daf6026d87aed1669feebd2c6d2ab28ae98cb8"
  elsif OS.mac? && Hardware::CPU.intel?
    url "https://distribute.kartikarora.me/bin/klaat/snapshot/0.1.0-ea2492e9/klaat-snapshot-macos-x64-0.1.0-ea2492e9"
    sha256 ""
  elsif OS.linux? && Hardware::CPU.arm?
    url "https://distribute.kartikarora.me/bin/klaat/snapshot/0.1.0-ea2492e9/klaat-snapshot-linux-arm64-0.1.0-ea2492e9"
    sha256 "4a9b6723f4820353741d077dce3e92af7f7165ad1caefadde1f5fd5284881258"
  elsif OS.linux? && Hardware::CPU.intel?
    url "https://distribute.kartikarora.me/bin/klaat/snapshot/0.1.0-ea2492e9/klaat-snapshot-linux-x64-0.1.0-ea2492e9"
    sha256 "a6a33f39fd646aa9791e6bb80da29ff58807f511182fda08f6c76457208b55a0"
  end

  def install
    bin.install Dir["klaat-*"].first => "klaat-snapshot"
  end

  test do
    assert_match "klaat", shell_output("#{bin}/klaat-snapshot --help")
  end
end
