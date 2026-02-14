class Orchy < Formula
  desc "Multi-agent orchestrator for Claude Code"
  homepage "https://github.com/orchyai/homebrew-tap"
  version "0.1.3"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/orchyai/homebrew-tap/releases/download/v0.1.3/orchy-macos-arm64"
      sha256 "8c41a84141fbfa155a9c1ccdb59d641ec03763ef72a08872213a0e54ea1fee9b"
    end
    on_intel do
      url "https://github.com/orchyai/homebrew-tap/releases/download/v0.1.3/orchy-macos-x64"
      sha256 "ede5b82eb37ad38d5e223f1f76f6aaaf22e8c356a12d97c318eb18650570dc6c"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/orchyai/homebrew-tap/releases/download/v0.1.3/orchy-linux-x64"
      sha256 "cbdf9b88cf783403e1291d9a2121e4fc7e7689869db5e1c168dcdb0af410aee5"
    end
    on_arm do
      url "https://github.com/orchyai/homebrew-tap/releases/download/v0.1.3/orchy-linux-arm64"
      sha256 "68394a3e3b1e99dced5989716f2d329349099643cc6580e792ab97b29441cd0d"
    end
  end

  def install
    if OS.mac?
      if Hardware::CPU.arm?
        bin.install "orchy-macos-arm64" => "orchy"
      else
        bin.install "orchy-macos-x64" => "orchy"
      end
    elsif OS.linux?
      if Hardware::CPU.arm?
        bin.install "orchy-linux-arm64" => "orchy"
      else
        bin.install "orchy-linux-x64" => "orchy"
      end
    end
  end

  def caveats
    <<~EOS
      To get started, run:
        orchy

      This starts the orchestrator and opens http://localhost:3456 in your browser.

      Options:
        orchy --port 8080     # Use specific port
        orchy --no-browser    # Don't open browser automatically
        orchy --help          # Show all options

      Requirements:
        Claude Code CLI must be installed:
        npm install -g @anthropic-ai/claude-code
    EOS
  end

  test do
    assert_match "version", shell_output("\#{bin}/orchy --help")
  end
end
