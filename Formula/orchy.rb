class Orchy < Formula
  desc "Multi-agent orchestrator for Claude Code"
  homepage "https://github.com/orchyai/homebrew-tap"
  version "0.1.1"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/orchyai/homebrew-tap/releases/download/v0.1.1/orchy-macos-arm64"
      sha256 "8c002e549494641acb66c6c771c8d87e5c905918b160798881cd18bd90a66e0b"
    end
    on_intel do
      url "https://github.com/orchyai/homebrew-tap/releases/download/v0.1.1/orchy-macos-x64"
      sha256 "d26af70e20e59b448ea2a77a6c303dd958e97ae89c3d7a569b69533c84216e76"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/orchyai/homebrew-tap/releases/download/v0.1.1/orchy-linux-x64"
      sha256 "c6c80cfd044f35d71ece5d6414c848442f41b3552ab14d665a52921455e32f5c"
    end
    on_arm do
      url "https://github.com/orchyai/homebrew-tap/releases/download/v0.1.1/orchy-linux-arm64"
      sha256 "cf2f57b54e9e262c5f9d84f30ec3b2af1354990d72b6bfe59462a0b8053feef9"
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
