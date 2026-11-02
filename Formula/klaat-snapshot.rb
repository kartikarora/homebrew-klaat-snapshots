class KlaatSnapshot < Formula
  desc "Klaat snapshot build - 2.1.0.43-63624aae"
  homepage "https://klaat.kartikarora.me"
  version "2.1.0.43-63624aae"

  # Default URL (macOS ARM64) to satisfy Homebrew's static parsing requirement
  url "https://distribute.kartikarora.me/bin/klaat/snapshot/2.1.0.43-63624aae/klaat-snapshot-macos-arm64-2.1.0.43-63624aae"
  sha256 "0fa74337a65e84b5bb6d07e4542d60a3e01755b08eca2087e0324d600457a767"

  if OS.linux?
    if Hardware::CPU.arm?
      url "https://distribute.kartikarora.me/bin/klaat/snapshot/2.1.0.43-63624aae/klaat-snapshot-linux-arm64-2.1.0.43-63624aae"
      sha256 "2805e59b2c454c6eb8e40d88f9157ba4a0085ce3c51c2cc4fb622a38dd2d5f41"
    elsif Hardware::CPU.intel?
      url "https://distribute.kartikarora.me/bin/klaat/snapshot/2.1.0.43-63624aae/klaat-snapshot-linux-x64-2.1.0.43-63624aae"
      sha256 "79f0fb508a79883010cef7ceb86bd55eed20cd80317ab80340b1c717a9eb7658"
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
