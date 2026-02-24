class KlaatSnapshot < Formula
  desc "Klaat snapshot build - 1.0.0-76654a92"
  homepage "https://klaat.kartikarora.me"
  version "1.0.0-76654a92"

  if OS.mac? && Hardware::CPU.arm?
    url "https://pub-eb432782c4e6445392194ae2c721a1d8.r2.dev/bin/klaat/snapshot/1.0.0-76654a92/klaat-macos-arm64-1.0.0-76654a92"
    sha256 "9fb0d7446b57bb10681effd5c2ece0d572068d1480689e2dc65ebf71e90ce4dd"
  elsif OS.mac? && Hardware::CPU.intel?
    url "https://pub-eb432782c4e6445392194ae2c721a1d8.r2.dev/bin/klaat/snapshot/1.0.0-76654a92/klaat-macos-x64-1.0.0-76654a92"
    sha256 "b540d05c6dc4652176e296af3bdf7f4ca26b00199dd1a58b3200556c82ff79b8"
  elsif OS.linux? && Hardware::CPU.arm?
    url "https://pub-eb432782c4e6445392194ae2c721a1d8.r2.dev/bin/klaat/snapshot/1.0.0-76654a92/klaat-linux-arm64-1.0.0-76654a92"
    sha256 "c6a6fefe0173d1dbd2910f1d3d4eaf677dc4111b73ad59b004bcd11a9b11d30e"
  elsif OS.linux? && Hardware::CPU.intel?
    url "https://pub-eb432782c4e6445392194ae2c721a1d8.r2.dev/bin/klaat/snapshot/1.0.0-76654a92/klaat-linux-x64-1.0.0-76654a92"
    sha256 "c8f6b7506137daabf83999dbf98ceb39a57795799610ecedc5a355d17bf99edb"
  end

  def install
    bin.install Dir["klaat-*"].first => "klaat"
  end

  test do
    assert_match "klaat", shell_output("#{bin}/klaat --help")
  end
end
