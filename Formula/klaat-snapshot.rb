class KlaatSnapshot < Formula
  desc "Klaat snapshot build - 0.1.0-7ca8e22d"
  homepage "https://klaat.kartikarora.me"
  version "0.1.0-7ca8e22d"

  if OS.mac? && Hardware::CPU.arm?
    url "https://distribute.kartikarora.me/bin/klaat/snapshot/0.1.0-7ca8e22d/klaat-snapshot-macos-arm64-0.1.0-7ca8e22d"
    sha256 "e2ec737ff238b00dc6573d9a97272567f9d7d2446eaf85227b00bacdbed74fe2"
  elsif OS.mac? && Hardware::CPU.intel?
    url "https://distribute.kartikarora.me/bin/klaat/snapshot/0.1.0-7ca8e22d/klaat-snapshot-macos-x64-0.1.0-7ca8e22d"
    sha256 ""
  elsif OS.linux? && Hardware::CPU.arm?
    url "https://distribute.kartikarora.me/bin/klaat/snapshot/0.1.0-7ca8e22d/klaat-snapshot-linux-arm64-0.1.0-7ca8e22d"
    sha256 "370a349b18740fbeabcc3447622338231e6c47d0e0a4d716458dc2b0e12c8138"
  elsif OS.linux? && Hardware::CPU.intel?
    url "https://distribute.kartikarora.me/bin/klaat/snapshot/0.1.0-7ca8e22d/klaat-snapshot-linux-x64-0.1.0-7ca8e22d"
    sha256 "a6cfb8197b945f10c65085c5a27b53dff178837c11f1c700a251b1f198002dfc"
  end

  def install
    bin.install Dir["klaat-*"].first => "klaat-snapshot"
  end

  test do
    assert_match "klaat", shell_output("#{bin}/klaat-snapshot --help")
  end
end
