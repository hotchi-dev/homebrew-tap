class Ripgrep < Formula
  desc "Search tool like grep and The Silver Searcher"
  homepage "https://github.com/BurntSushi/ripgrep"
  url "https://github.com/BurntSushi/ripgrep/archive/refs/tags/15.2.0.tar.gz"
  sha256 "7605249d3eb0d5f170e3414498e3344e26b1e7a147aec518b57090b80036a562"

  bottle do
    root_url "https://ghcr.io/v2/homebrew/core"
    rebuild 1
    sha256 cellar: :any, arm64_golden_gate: "327215e000a1e83a9e3bf643bd88a3211796bfede87958955ad2a27df270ec4d"
    sha256 cellar: :any, arm64_sequoia:     "2754dac3a512be2007dde3a8a481f1753ea9b0e22041a1a32b544daed966981b"
    sha256 cellar: :any, arm64_sonoma:      "8e485dfa978673c6ada6f83ca39f5f15f8b7444b0cdbe8814cd3d3d7bd83afa0"
    sha256 cellar: :any, arm64_tahoe:       "7829e262f0ebbb51c4744b343bf801a5107479fe08c6d6f61f4d909748cba337"
    sha256 cellar: :any, sonoma:            "9dd76bad725daf9ad1d4c983419e79ec92aefdae0cc9c92d465b424c8aea4808"
  end

  depends_on "hotchi-dev/tap/pcre2"

  def install
    odie "Quill tap is bottle-only; this macOS/architecture has no pinned bottle"
  end

  test do
    assert_path_exists prefix
  end
end
