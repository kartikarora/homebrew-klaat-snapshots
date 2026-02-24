class KlaatSnapshot < Formula
  desc "Klaat snapshot build - 1.0.0-e4ea4a92"
  homepage "https://klaat.kartikarora.me"
  version "1.0.0-e4ea4a92"

  if OS.mac? && Hardware::CPU.arm?
    url "https://pub-eb432782c4e6445392194ae2c721a1d8.r2.dev/bin/klaat/snapshot/1.0.0-e4ea4a92/klaat-macos-arm64-1.0.0-e4ea4a92"
    sha256 "79b0c471055aea90e41200c083cceb2ab474c5c881cb7fb85a5af9fedff27ced"
  elsif OS.mac? && Hardware::CPU.intel?
    url "https://pub-eb432782c4e6445392194ae2c721a1d8.r2.dev/bin/klaat/snapshot/1.0.0-e4ea4a92/klaat-macos-x64-1.0.0-e4ea4a92"
    sha256 "b3ad7ced3d296062fb4460e98ec6aa9ea4f8bd0020d4395066b0abfa87f01059"
  elsif OS.linux? && Hardware::CPU.arm?
    url "https://pub-eb432782c4e6445392194ae2c721a1d8.r2.dev/bin/klaat/snapshot/1.0.0-e4ea4a92/klaat-linux-arm64-1.0.0-e4ea4a92"
    sha256 "4447dbba2053d7a40cf90b3bfc8412358dab2284db68e5a9f7cb3a8cb000264c"
  elsif OS.linux? && Hardware::CPU.intel?
    url "https://pub-eb432782c4e6445392194ae2c721a1d8.r2.dev/bin/klaat/snapshot/1.0.0-e4ea4a92/klaat-linux-x64-1.0.0-e4ea4a92"
    sha256 "2de109b13a02f81c56057362e537c6d68753fb629bd9ff3c664f652e4b75f46a"
  end

  def install
    bin.install Dir["klaat-*"].first => "klaat"
  end

  test do
    assert_match "klaat", shell_output("#{bin}/klaat --help")
  end
end
