# Template rendered by .github/workflows/release.yml (0.1.0 and {{SHA256_*}} substituted)
# and pushed to codesplash-ai/homebrew-tap as Formula/codesplash-agent.rb.
class CodesplashAgent < Formula
  desc "Terminal cockpit for Codex and Claude Code"
  homepage "https://github.com/codesplash-ai/codesplash-agent"
  version "0.1.0"
  license "BUSL-1.1"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/codesplash-ai/codesplash-agent/releases/download/v#{version}/codesplash-agent-#{version}-darwin-arm64.tar.gz"
      sha256 "2c08bce146b718fa8723e2771dc909e5605cda4651f82098cdee65565375a920"
    else
      url "https://github.com/codesplash-ai/codesplash-agent/releases/download/v#{version}/codesplash-agent-#{version}-darwin-x64.tar.gz"
      sha256 "86dc7650652bf5d67a751275a91fb0affca67ea79ac72e2bb4b1b0cab8895bc4"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/codesplash-ai/codesplash-agent/releases/download/v#{version}/codesplash-agent-#{version}-linux-arm64.tar.gz"
      sha256 "90afaad71953d02bd5e1b8490161eb37f16f40854edb73e888829dc83da08665"
    else
      url "https://github.com/codesplash-ai/codesplash-agent/releases/download/v#{version}/codesplash-agent-#{version}-linux-x64.tar.gz"
      sha256 "563fa94d43d9693d0fe3400f859c72e08df23d2906e8c8f1967e839e724e3d3b"
    end
  end

  def install
    bin.install "codesplash"
  end

  def caveats
    <<~EOS
      CodeSplash Agent drives the official provider CLIs; install and log in separately:
        Codex CLI 0.147.0:  npm i -g @openai/codex@0.147.0
        Claude Code:        https://code.claude.com
    EOS
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/codesplash --version")
  end
end
