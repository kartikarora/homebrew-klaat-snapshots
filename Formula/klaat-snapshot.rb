class KlaatSnapshot < Formula
  desc "Klaat snapshot build - 0.1.0-d2293735"
  homepage "https://klaat.kartikarora.me"
  version "0.1.0-d2293735"

  if OS.mac? && Hardware::CPU.arm?
    url "https://distribute.kartikarora.me/bin/klaat/snapshot/0.1.0-d2293735/klaat-snapshot-macos-arm64-0.1.0-d2293735"
    sha256 "0e6efd842e05bbaa542a4ea0e49cc24b7a2d62490295d5430d85bc7d6e5c0de7"
  elsif OS.mac? && Hardware::CPU.intel?
    url "https://distribute.kartikarora.me/bin/klaat/snapshot/0.1.0-d2293735/klaat-snapshot-macos-x64-0.1.0-d2293735"
    sha256 ""
  elsif OS.linux? && Hardware::CPU.arm?
    url "https://distribute.kartikarora.me/bin/klaat/snapshot/0.1.0-d2293735/klaat-snapshot-linux-arm64-0.1.0-d2293735"
    sha256 "23f6af018424455c7a905d35f6ae66544494261a2f61532f1ee826328327f968"
  elsif OS.linux? && Hardware::CPU.intel?
    url "https://distribute.kartikarora.me/bin/klaat/snapshot/0.1.0-d2293735/klaat-snapshot-linux-x64-0.1.0-d2293735"
    sha256 "939d85848cbe900fa1ad51262d6dc16885eec56da32b331b8bc6568dd62a4b5d"
  end

  def install
    bin.install Dir["klaat-*"].first => "klaat-snapshot"
  end

  test do
    assert_match "klaat", shell_output("#{bin}/klaat-snapshot --help")
  end
end
