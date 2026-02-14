class Orchy < Formula
  desc "Multi-agent orchestrator for Claude Code"
  homepage "https://github.com/orchyai/homebrew-tap"
  version "0.1.0"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/orchyai/homebrew-tap/releases/download/v0.1.0/orchy-macos-arm64"
      sha256 "8d1088b64bbee7a40e91588f3e3bcf9f04961b3444f7398d5418b66080955344"
    end
    on_intel do
      url "https://github.com/orchyai/homebrew-tap/releases/download/v0.1.0/orchy-macos-x64"
      sha256 "0ed8e6d159a719b9f6072263fa4e98061996aad59aff0cbe22d2bb7ff23003e3"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/orchyai/homebrew-tap/releases/download/v0.1.0/orchy-linux-x64"
      sha256 "c4f7c8b588eb67ad992743d49551d05317df614dbf47681e6df5178c6573dece"
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
      bin.install "orchy-linux-x64" => "orchy"
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
