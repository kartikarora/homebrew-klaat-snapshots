class KlaatSnapshot < Formula
  desc "Klaat snapshot build - 2.1.0.42-f5171060"
  homepage "https://klaat.kartikarora.me"
  version "2.1.0.42-f5171060"

  # Default URL (macOS ARM64) to satisfy Homebrew's static parsing requirement
  url "https://distribute.kartikarora.me/bin/klaat/snapshot/2.1.0.42-f5171060/klaat-snapshot-macos-arm64-2.1.0.42-f5171060"
  sha256 "34f26a218e975fa8933f51fd62ef262ce44fedc36bde7c07b7e3a7f23eeae264"

  if OS.linux?
    if Hardware::CPU.arm?
      url "https://distribute.kartikarora.me/bin/klaat/snapshot/2.1.0.42-f5171060/klaat-snapshot-linux-arm64-2.1.0.42-f5171060"
      sha256 "fcedb3c1e309ddf8b996cbe03af17de40653d8f7d5fd7fea42b863728562c074"
    elsif Hardware::CPU.intel?
      url "https://distribute.kartikarora.me/bin/klaat/snapshot/2.1.0.42-f5171060/klaat-snapshot-linux-x64-2.1.0.42-f5171060"
      sha256 "7456a985bfa080ae478b02c616f7831056337cbdb30c3d03da5f1e54f44613a0"
    end
  end

  def install
    if OS.mac? && Hardware::CPU.intel?
      odie "Klaat only supports Apple Silicon Macs. Intel Macs are not supported."
    end

    bin.install Dir["klaat-*"].first => "klaat-snapshot"
  end

  test do
    assert_match "klaat", shell_output("#{bin}/klaat-snapshot --help")
  end
end
