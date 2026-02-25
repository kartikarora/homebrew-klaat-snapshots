class KlaatSnapshot < Formula
  desc "Klaat snapshot build - 0.1.0-3610c5a3"
  homepage "https://klaat.kartikarora.me"
  version "0.1.0-3610c5a3"

  if OS.mac? && Hardware::CPU.arm?
    url "https://distribute.kartikarora.me/bin/klaat/snapshot/0.1.0-3610c5a3/klaat-snapshot-macos-arm64-0.1.0-3610c5a3"
    sha256 "543da016968dade3cd2c3a57967f546eb467881238a845cd60e199797447333e"
  elsif OS.mac? && Hardware::CPU.intel?
    url "https://distribute.kartikarora.me/bin/klaat/snapshot/0.1.0-3610c5a3/klaat-snapshot-macos-x64-0.1.0-3610c5a3"
    sha256 ""
  elsif OS.linux? && Hardware::CPU.arm?
    url "https://distribute.kartikarora.me/bin/klaat/snapshot/0.1.0-3610c5a3/klaat-snapshot-linux-arm64-0.1.0-3610c5a3"
    sha256 "3142c997ec1e358364e02083015e07a3b302a0a422f4298976e44b3b1621a893"
  elsif OS.linux? && Hardware::CPU.intel?
    url "https://distribute.kartikarora.me/bin/klaat/snapshot/0.1.0-3610c5a3/klaat-snapshot-linux-x64-0.1.0-3610c5a3"
    sha256 "e34e9bf55a3b9176fc3f6c4a2d78fb9437571620c558d736faa2b37543e81a3c"
  end

  def install
    bin.install Dir["klaat-*"].first => "klaat-snapshot"
  end

  test do
    assert_match "klaat", shell_output("#{bin}/klaat-snapshot --help")
  end
end
