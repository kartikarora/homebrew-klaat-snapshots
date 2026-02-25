class KlaatSnapshot < Formula
  desc "Klaat snapshot build - 1.0.0-faf573ec"
  homepage "https://klaat.kartikarora.me"
  version "1.0.0-faf573ec"

  if OS.mac? && Hardware::CPU.arm?
    url "https://distribute.kartikarora.me/bin/klaat/snapshot/1.0.0-faf573ec/klaat-snapshot-macos-arm64-1.0.0-faf573ec"
    sha256 "11d7dc4faf6c090ca80a00005de745695cf406b593ca88d7009c5be5b9882e54"
  elsif OS.mac? && Hardware::CPU.intel?
    url "https://distribute.kartikarora.me/bin/klaat/snapshot/1.0.0-faf573ec/klaat-snapshot-macos-x64-1.0.0-faf573ec"
    sha256 ""
  elsif OS.linux? && Hardware::CPU.arm?
    url "https://distribute.kartikarora.me/bin/klaat/snapshot/1.0.0-faf573ec/klaat-snapshot-linux-arm64-1.0.0-faf573ec"
    sha256 "1d9f6281ac662e89a82ba3a4ef5e4ed6eab0a27a1bc9ab3ff66b76226b2b8d79"
  elsif OS.linux? && Hardware::CPU.intel?
    url "https://distribute.kartikarora.me/bin/klaat/snapshot/1.0.0-faf573ec/klaat-snapshot-linux-x64-1.0.0-faf573ec"
    sha256 "0f36963382ad4197b79c2d0aaa102ed5092e817ed579835246a17f716a16e5e6"
  end

  def install
    bin.install Dir["klaat-*"].first => "klaat"
  end

  test do
    assert_match "klaat", shell_output("#{bin}/klaat --help")
  end
end
