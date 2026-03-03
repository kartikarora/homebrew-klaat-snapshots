class KlaatSnapshot < Formula
  desc "Klaat snapshot build - 0.1.0-2595ecfe"
  homepage "https://klaat.kartikarora.me"
  version "0.1.0-2595ecfe"

  if OS.mac? && Hardware::CPU.arm?
    url "https://pub-eb432782c4e6445392194ae2c721a1d8.r2.dev/bin/klaat/snapshot/0.1.0-2595ecfe/klaat-snapshot-macos-arm64-0.1.0-2595ecfe"
    sha256 "75045dc90b1790811255fad5513322eb9be3542c60bed596fd1d0e168751c726"
  elsif OS.mac? && Hardware::CPU.intel?
    url "https://pub-eb432782c4e6445392194ae2c721a1d8.r2.dev/bin/klaat/snapshot/0.1.0-2595ecfe/klaat-snapshot-macos-x64-0.1.0-2595ecfe"
    sha256 "8038d3a94e4cecaa1830b6b4ec51f29d808683e276c9bfb19213f11cdd07f321"
  elsif OS.linux? && Hardware::CPU.arm?
    url "https://pub-eb432782c4e6445392194ae2c721a1d8.r2.dev/bin/klaat/snapshot/0.1.0-2595ecfe/klaat-snapshot-linux-arm64-0.1.0-2595ecfe"
    sha256 "f23b80c74b31a08657cd243771a4603f2fff311255af85235c87e490ebd2ff1e"
  elsif OS.linux? && Hardware::CPU.intel?
    url "https://pub-eb432782c4e6445392194ae2c721a1d8.r2.dev/bin/klaat/snapshot/0.1.0-2595ecfe/klaat-snapshot-linux-x64-0.1.0-2595ecfe"
    sha256 "96e06e816e17bb14a46ab30977dd52874ff5cd3f6913873eec9d2747c0fb4b4f"
  end

  def install
    bin.install Dir["klaat-*"].first => "klaat-snapshot"
  end

  test do
    assert_match "klaat", shell_output("#{bin}/klaat-snapshot --help")
  end
end
