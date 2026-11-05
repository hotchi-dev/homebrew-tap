class Gh < Formula
  desc "GitHub command-line tool"
  homepage "https://cli.github.com/"
  url "https://github.com/cli/cli/archive/refs/tags/v2.103.3.tar.gz"
  version "2.103.3"
  sha256 "bb148138a3a2fe023e57c78042fe3b42fc09171c0e8fff4cf983b227b7a2eade"

  bottle do
    root_url "https://ghcr.io/v2/homebrew/core"
    sha256 cellar: :any_skip_relocation, arm64_golden_gate: "3a6c3b09eca8a065522c78d3c2ba739e866afd64eb2b0a6280527b05e5539151"
    sha256 cellar: :any_skip_relocation, arm64_sequoia:     "21e6314bf4f4f9d881b0ab6ba1f6bad3c940ab419f8b689f83a526eb646291f2"
    sha256 cellar: :any_skip_relocation, arm64_tahoe:       "901fc52c4611b1c716ed73b31d516d6bb6b37bcfb8abbedc537404bc80ec5e26"
  end

  def install
    odie "Quill tap is bottle-only; this macOS/architecture has no pinned bottle"
  end

  test do
    assert_path_exists prefix
  end
end
