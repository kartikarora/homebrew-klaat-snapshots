class KlaatSnapshot < Formula
  desc "Klaat snapshot build - 0.3.0.23-9cb4ff8f"
  homepage "https://klaat.kartikarora.me"
  version "0.3.0.23-9cb4ff8f"

  if OS.mac? && Hardware::CPU.arm?
    url "https://distribute.kartikarora.me/bin/klaat/snapshot/0.3.0.23-9cb4ff8f/klaat-snapshot-macos-arm64-0.3.0.23-9cb4ff8f"
    sha256 "7cc17b82aa1c5f7ee11ce86ccedbe1a6e5936e8a3acb98473206c903eae915f3"
  elsif OS.linux? && Hardware::CPU.arm?
    url "https://distribute.kartikarora.me/bin/klaat/snapshot/0.3.0.23-9cb4ff8f/klaat-snapshot-linux-arm64-0.3.0.23-9cb4ff8f"
    sha256 "c8d930b1ab4d114657f4dbd02bd57d09091a18b914ac73561eea1b95eb973d87"
  elsif OS.linux? && Hardware::CPU.intel?
    url "https://distribute.kartikarora.me/bin/klaat/snapshot/0.3.0.23-9cb4ff8f/klaat-snapshot-linux-x64-0.3.0.23-9cb4ff8f"
    sha256 "9f6fc172ec489ee98e6bbcde08d69110414956a418d3d8e4a0283c6e9a308960"
  end

  def install
    bin.install Dir["klaat-*"].first => "klaat-snapshot"
  end

  test do
    assert_match "klaat", shell_output("#{bin}/klaat-snapshot --help")
  end
end
