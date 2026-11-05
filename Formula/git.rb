class Git < Formula
  desc "Distributed revision control system"
  homepage "https://git-scm.com"
  url "https://mirrors.edge.kernel.org/pub/software/scm/git/git-2.56.0.tar.xz"
  version "2.56.0"
  sha256 "26c56c296b38c0695b26fa95f475f1d01704d2d38e73465ca30b0b2f5dc789d3"
  revision 2

  bottle do
    root_url "https://ghcr.io/v2/homebrew/core"
    sha256 cellar: "/opt/homebrew/Cellar", arm64_golden_gate: "a974c47b8f63bbc98389df7e942aae13fb881f05f9cd94c2bdca0767a19e2554"
    sha256 cellar: "/opt/homebrew/Cellar", arm64_sequoia:     "6106c08b84b66b28800b2b837a77a855b7b600bc922f6999d1980e8d78b53294"
    sha256 cellar: "/opt/homebrew/Cellar", arm64_tahoe:       "ae0057867c6fc57d89f7b141e095f084a39bb30dc5fd1fd81ab984de5a74740c"
  end

  depends_on "hotchi-dev/tap/curl"
  depends_on "hotchi-dev/tap/gettext"
  depends_on "hotchi-dev/tap/pcre2"

  def install
    odie "Quill tap is bottle-only; this macOS/architecture has no pinned bottle"
  end

  test do
    assert_path_exists prefix
  end
end
