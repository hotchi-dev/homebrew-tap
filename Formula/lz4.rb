class Lz4 < Formula
  desc "Extremely Fast Compression algorithm"
  homepage "https://lz4.github.io/lz4/"
  url "https://github.com/lz4/lz4/archive/refs/tags/v1.11.1.tar.gz"
  sha256 "683fed08a844ad012196381e40badf80c0bbe4962959761416d41c9e67d77ec7"

  bottle do
    root_url "https://ghcr.io/v2/homebrew/core"
    sha256 cellar: :any, arm64_golden_gate: "b2422bda202e4a59007a9189493902ac7a75423640081da43de9281a89770d5c"
    sha256 cellar: :any, arm64_sequoia:     "69c0c38e660f81b36bbd165a77d7619d2b8b6b175bf670a4840aaaaddd86a520"
    sha256 cellar: :any, arm64_tahoe:       "9ab0175d769ca830f573defafb22b020f3e9b4e0862ee6ee9f47e0b46a29468d"
  end

  def install
    odie "Quill tap is bottle-only; this macOS/architecture has no pinned bottle"
  end

  test do
    assert_path_exists prefix
  end
end
