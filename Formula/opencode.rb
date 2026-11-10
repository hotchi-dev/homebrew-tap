class Opencode < Formula
  desc "AI coding agent, built for the terminal"
  homepage "https://opencode.ai"
  url "https://github.com/anomalyco/opencode/archive/refs/tags/v2.2.7.tar.gz"
  sha256 "493e29d872f1cd9604ef3de609f0278e093c0f8066719e4166efc6544d16f34d"

  bottle do
    root_url "https://ghcr.io/v2/homebrew/core"
    sha256 cellar: "/opt/homebrew/Cellar", arm64_golden_gate: "54591d7764c0d3a9b2b68e4c23fddb205276fcb9ed7f8e700daa1665332c53b6"
    sha256 cellar: "/opt/homebrew/Cellar", arm64_sequoia:     "2394d1223865d5244ea920c140254f92cca64e746d1a41a48e913aba2c896a59"
    sha256 cellar: "/opt/homebrew/Cellar", arm64_tahoe:       "b6a424039b9e14e0dc0b16e5051703ed6d5c163ba8074eae9b4e084a0b012fc4"
  end

  depends_on "hotchi-dev/tap/ripgrep"

  def install
    odie "Quill tap is bottle-only; this macOS/architecture has no pinned bottle"
  end

  test do
    assert_path_exists prefix
  end
end
