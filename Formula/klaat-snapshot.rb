class KlaatSnapshot < Formula
  desc "Klaat snapshot build - 0.1.0.18-5fa238b8"
  homepage "https://klaat.kartikarora.me"
  version "0.1.0.18-5fa238b8"

  if OS.mac? && Hardware::CPU.arm?
    url "https://distribute.kartikarora.me/bin/klaat/snapshot/0.1.0.18-5fa238b8/klaat-snapshot-macos-arm64-0.1.0.18-5fa238b8"
    sha256 "b90c4a60894edfee734f64313991fd1512aded79bad6295265fb079e53300148"
  elsif OS.linux? && Hardware::CPU.arm?
    url "https://distribute.kartikarora.me/bin/klaat/snapshot/0.1.0.18-5fa238b8/klaat-snapshot-linux-arm64-0.1.0.18-5fa238b8"
    sha256 "3e6f62f469abd47486392a583bd735d8dec500c57522dfb2ed754cc3c5da88c2"
  elsif OS.linux? && Hardware::CPU.intel?
    url "https://distribute.kartikarora.me/bin/klaat/snapshot/0.1.0.18-5fa238b8/klaat-snapshot-linux-x64-0.1.0.18-5fa238b8"
    sha256 "693d6219e06fd62d97ece24a57f3f05a9f02aed088e4fb84d1f9e7ff8d5eb9ed"
  end

  def install
    bin.install Dir["klaat-*"].first => "klaat-snapshot"
  end

  test do
    assert_match "klaat", shell_output("#{bin}/klaat-snapshot --help")
  end
end
