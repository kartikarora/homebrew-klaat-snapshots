class KlaatSnapshot < Formula
  desc "Klaat snapshot build - 0.4.0.24-12c70992"
  homepage "https://klaat.kartikarora.me"
  version "0.4.0.24-12c70992"

  if OS.mac? && Hardware::CPU.arm?
    url "https://distribute.kartikarora.me/bin/klaat/snapshot/0.4.0.24-12c70992/klaat-snapshot-macos-arm64-0.4.0.24-12c70992"
    sha256 "8c4fa42e13d54de78111ec3221c965896ff96461a3dc91225fb3589835ac762d"
  elsif OS.linux? && Hardware::CPU.arm?
    url "https://distribute.kartikarora.me/bin/klaat/snapshot/0.4.0.24-12c70992/klaat-snapshot-linux-arm64-0.4.0.24-12c70992"
    sha256 "993e7015a31872ef76bd2c6dcfbae6016cf5cc10dba50f6b8e154860953c7796"
  elsif OS.linux? && Hardware::CPU.intel?
    url "https://distribute.kartikarora.me/bin/klaat/snapshot/0.4.0.24-12c70992/klaat-snapshot-linux-x64-0.4.0.24-12c70992"
    sha256 "db8077fae0634239df49355e0690d2986f07b882fd28cdacd3387ed6996c6e0c"
  end

  def install
    bin.install Dir["klaat-*"].first => "klaat-snapshot"
  end

  test do
    assert_match "klaat", shell_output("#{bin}/klaat-snapshot --help")
  end
end
