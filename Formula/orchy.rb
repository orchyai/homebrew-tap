class Orchy < Formula
  desc "Multi-agent orchestrator for Claude Code"
  homepage "https://github.com/orchyai/homebrew-tap"
  version "0.1.2"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/orchyai/homebrew-tap/releases/download/v0.1.2/orchy-macos-arm64"
      sha256 "6a113d162b92a7398616883372277372ee42d9a36c1ca6350d66ba8fae050c28"
    end
    on_intel do
      url "https://github.com/orchyai/homebrew-tap/releases/download/v0.1.2/orchy-macos-x64"
      sha256 "854856306692c8fcb51fe40a11cc2987045e24f37b5436d8745f75223f76dbdb"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/orchyai/homebrew-tap/releases/download/v0.1.2/orchy-linux-x64"
      sha256 "b8d7eec53a3cb66d9b313010163497aef74150e72d8bab5d1e7a68f9821cddb8"
    end
    on_arm do
      url "https://github.com/orchyai/homebrew-tap/releases/download/v0.1.2/orchy-linux-arm64"
      sha256 "67daf66fdbe7a0942b42489ce85c54ef4e6b9ecac04b99877175994d0616e01e"
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
