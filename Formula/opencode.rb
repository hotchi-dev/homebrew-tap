class Opencode < Formula
  desc "AI coding agent, built for the terminal"
  homepage "https://opencode.ai"
  url "https://github.com/anomalyco/opencode/archive/refs/tags/v2.2.5.tar.gz"
  version "2.2.5"
  sha256 "04621edf6c47c2c7a36982ef39914d482c16977708fbd7b779f49f928bdc4fba"

  bottle do
    root_url "https://ghcr.io/v2/homebrew/core"
    rebuild 1
    sha256 cellar: "/opt/homebrew/Cellar", arm64_golden_gate: "c5c9005403cebf90c25d10599a7fcdaafb664eafa91d20c1be16f830cf3c8e1a"
    sha256 cellar: "/opt/homebrew/Cellar", arm64_sequoia:     "298115ba70a52fff940c6a54e3399591927c96d84cd07d910690f13027290bdc"
    sha256 cellar: "/opt/homebrew/Cellar", arm64_tahoe:       "ee89b294d1465431bc1734602266b1b9b1fcff7abb113a969540ba838eeee998"
  end

  depends_on "hotchi-dev/tap/ripgrep"

  def install
    odie "Quill tap is bottle-only; this macOS/architecture has no pinned bottle"
  end

  test do
    assert_path_exists prefix
  end
end
