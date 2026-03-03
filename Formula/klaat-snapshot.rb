class KlaatSnapshot < Formula
  desc "Klaat snapshot build - 0.1.0.16-818b1f4c"
  homepage "https://klaat.kartikarora.me"
  version "0.1.0.16-818b1f4c"

  if OS.mac? && Hardware::CPU.arm?
    url "https://distribute.kartikarora.me/bin/klaat/snapshot/0.1.0.16-818b1f4c/klaat-snapshot-macos-arm64-0.1.0.16-818b1f4c"
    sha256 "4c421844ea41c438eeeec3387d37ba3799d2bb73ec5d26bc128aca5038690ad1"
  elsif OS.linux? && Hardware::CPU.arm?
    url "https://distribute.kartikarora.me/bin/klaat/snapshot/0.1.0.16-818b1f4c/klaat-snapshot-linux-arm64-0.1.0.16-818b1f4c"
    sha256 "18ad64d5db127c5fdbcf36a33bb650e5a9c31d6bec9bde6b81b469e1307130aa"
  elsif OS.linux? && Hardware::CPU.intel?
    url "https://distribute.kartikarora.me/bin/klaat/snapshot/0.1.0.16-818b1f4c/klaat-snapshot-linux-x64-0.1.0.16-818b1f4c"
    sha256 "36cd8dffb9a63f6a572a12f678237214d0fd9ce2a497da2750c65811fcdcfe14"
  end

  def install
    bin.install Dir["klaat-*"].first => "klaat-snapshot"
  end

  test do
    assert_match "klaat", shell_output("#{bin}/klaat-snapshot --help")
  end
end
