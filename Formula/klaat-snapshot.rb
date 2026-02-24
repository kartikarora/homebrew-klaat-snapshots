class KlaatSnapshot < Formula
  desc "Klaat snapshot build - 1.0.0-baeed0d7"
  homepage "https://klaat.kartikarora.me"
  version "1.0.0-baeed0d7"

  if OS.mac? && Hardware::CPU.arm?
    url "https://pub-eb432782c4e6445392194ae2c721a1d8.r2.dev/bin/klaat/snapshot/1.0.0-baeed0d7/klaat-macos-arm64-1.0.0-baeed0d7"
    sha256 "c73157271006894a030798d3bbffe087fe159df29c1c2c1d3ef13cf5fc8d2d37"
  elsif OS.mac? && Hardware::CPU.intel?
    url "https://pub-eb432782c4e6445392194ae2c721a1d8.r2.dev/bin/klaat/snapshot/1.0.0-baeed0d7/klaat-macos-x64-1.0.0-baeed0d7"
    sha256 "1ab554982ce5160159136651b8952e974f44beee1837e53951a46099024ed6a2"
  elsif OS.linux? && Hardware::CPU.arm?
    url "https://pub-eb432782c4e6445392194ae2c721a1d8.r2.dev/bin/klaat/snapshot/1.0.0-baeed0d7/klaat-linux-arm64-1.0.0-baeed0d7"
    sha256 "3f62e009e24901eb8d63503591afa2577943cbc3da402b588dc2320c78662045"
  elsif OS.linux? && Hardware::CPU.intel?
    url "https://pub-eb432782c4e6445392194ae2c721a1d8.r2.dev/bin/klaat/snapshot/1.0.0-baeed0d7/klaat-linux-x64-1.0.0-baeed0d7"
    sha256 "f0bf2f9933cdc9296fecd447e88bf92cf2437d375f02457b5277d2fc2e616ece"
  end

  def install
    bin.install Dir["klaat-*"].first => "klaat"
  end

  test do
    assert_match "klaat", shell_output("#{bin}/klaat --help")
  end
end
