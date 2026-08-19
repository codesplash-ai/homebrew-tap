# Template rendered by .github/workflows/release.yml (0.1.4 and {{SHA256_*}} substituted)
# and pushed to codesplash-ai/homebrew-tap as Formula/codesplash-agent.rb.
class CodesplashAgent < Formula
  desc "Terminal cockpit for Codex and Claude Code"
  homepage "https://github.com/codesplash-ai/codesplash-agent"
  version "0.1.4"
  license "BUSL-1.1"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/codesplash-ai/codesplash-agent/releases/download/v#{version}/codesplash-agent-#{version}-darwin-arm64.tar.gz"
      sha256 "aee820432c8ef06c32109bd031fface4209edef9ffecd72c427e6df9946dd45c"
    else
      url "https://github.com/codesplash-ai/codesplash-agent/releases/download/v#{version}/codesplash-agent-#{version}-darwin-x64.tar.gz"
      sha256 "4283eac4de511276e453a47b8d8f047a89bf68556ba7b14785351dfa9b000d32"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/codesplash-ai/codesplash-agent/releases/download/v#{version}/codesplash-agent-#{version}-linux-arm64.tar.gz"
      sha256 "c0b3b2839bf9dc29256cdf30f8a2dfcffc6afd08a6494a5e15596fa3e1e950dc"
    else
      url "https://github.com/codesplash-ai/codesplash-agent/releases/download/v#{version}/codesplash-agent-#{version}-linux-x64.tar.gz"
      sha256 "9f0033ef34fd1c91c2d41c2ee86ef3c98d1a06c9813fc1c966bb713ad4759b40"
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
