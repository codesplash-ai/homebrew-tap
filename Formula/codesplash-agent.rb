# Template rendered by .github/workflows/release.yml (0.2.0 and {{SHA256_*}} substituted)
# and pushed to codesplash-ai/homebrew-tap as Formula/codesplash-agent.rb.
class CodesplashAgent < Formula
  desc "Terminal harness for Codex and Claude Code"
  homepage "https://github.com/codesplash-ai/codesplash-agent"
  version "0.2.0"
  license "BUSL-1.1"
  depends_on "ripgrep"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/codesplash-ai/codesplash-agent/releases/download/v#{version}/codesplash-agent-#{version}-darwin-arm64.tar.gz"
      sha256 "b3545fd64ff02834e50b4aba6674a51ff5825417a125f7225bfb7959aed8fa7a"
    else
      url "https://github.com/codesplash-ai/codesplash-agent/releases/download/v#{version}/codesplash-agent-#{version}-darwin-x64.tar.gz"
      sha256 "cfce70874d9be0cecdbd00bb11139b45d639e131e2f76716fc3929e6dd046c3b"
    end
  end

  on_linux do
    depends_on "bubblewrap"
    depends_on "socat"
    if Hardware::CPU.arm?
      url "https://github.com/codesplash-ai/codesplash-agent/releases/download/v#{version}/codesplash-agent-#{version}-linux-arm64.tar.gz"
      sha256 "b0ad9848e6cb01c3ce4577e8b2414312ac56b253559b243f0a6a71614055f826"
    else
      url "https://github.com/codesplash-ai/codesplash-agent/releases/download/v#{version}/codesplash-agent-#{version}-linux-x64.tar.gz"
      sha256 "1a5e3a084de8dff2976de8ae28fa1240544c2065346ed12d5afe42354bbf1e56"
    end
  end

  def install
    libexec.install "codesplash", "sandbox-runtime"
    bin.write_exec_script libexec/"codesplash"
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
