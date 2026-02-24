class KlaatSnapshot < Formula
  desc "Klaat snapshot build - 1.0.0-d0468089"
  homepage "https://klaat.kartikarora.me"
  version "1.0.0-d0468089"

  if OS.mac? && Hardware::CPU.arm?
    url "https://pub-eb432782c4e6445392194ae2c721a1d8.r2.dev/bin/klaat/snapshot/1.0.0-d0468089/klaat-macos-arm64-1.0.0-d0468089"
    sha256 "01d6d0ede8d893525b376e07000a1da19f3c93e3dacc9c46fde3256597090726"
  elsif OS.mac? && Hardware::CPU.intel?
    url "https://pub-eb432782c4e6445392194ae2c721a1d8.r2.dev/bin/klaat/snapshot/1.0.0-d0468089/klaat-macos-x64-1.0.0-d0468089"
    sha256 "98935bf022d5ec9d53c0815ac8b7772c0462d0017453c5054225e617d9e35421"
  elsif OS.linux? && Hardware::CPU.arm?
    url "https://pub-eb432782c4e6445392194ae2c721a1d8.r2.dev/bin/klaat/snapshot/1.0.0-d0468089/klaat-linux-arm64-1.0.0-d0468089"
    sha256 "234da9ebedc6c1de843f72099ecac15941076f45588200b328564d1750c25d4a"
  elsif OS.linux? && Hardware::CPU.intel?
    url "https://pub-eb432782c4e6445392194ae2c721a1d8.r2.dev/bin/klaat/snapshot/1.0.0-d0468089/klaat-linux-x64-1.0.0-d0468089"
    sha256 "81e746ebfb11c8ae292128469c6b76f87cf0d15a5f1bbd4aa5158fb46d1ae915"
  end

  def install
    bin.install Dir["klaat-*"].first => "klaat"
  end

  test do
    assert_match "klaat", shell_output("#{bin}/klaat --help")
  end
end
