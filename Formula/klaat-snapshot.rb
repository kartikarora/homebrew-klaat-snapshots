class KlaatSnapshot < Formula
  desc "Klaat snapshot build - 1.2.0.33-2235c4da"
  homepage "https://klaat.kartikarora.me"
  version "1.2.0.33-2235c4da"

  # Default URL (macOS ARM64) to satisfy Homebrew's static parsing requirement
  url "https://distribute.kartikarora.me/bin/klaat/snapshot/1.2.0.33-2235c4da/klaat-snapshot-macos-arm64-1.2.0.33-2235c4da"
  sha256 "df9829efad4f5971713f97d8757bb5d81ac1bf27ab2b0ec3c531da90f0c556fc"

  if OS.linux?
    if Hardware::CPU.arm?
      url "https://distribute.kartikarora.me/bin/klaat/snapshot/1.2.0.33-2235c4da/klaat-snapshot-linux-arm64-1.2.0.33-2235c4da"
      sha256 "f80ca036e2357a680cf6b58da1ac6620109618fae903635768c8e4e785d04e32"
    elsif Hardware::CPU.intel?
      url "https://distribute.kartikarora.me/bin/klaat/snapshot/1.2.0.33-2235c4da/klaat-snapshot-linux-x64-1.2.0.33-2235c4da"
      sha256 "485bead7c56626845a983544cb8aaa8a7af10c967a0cc1daafe23a2df7f17970"
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
