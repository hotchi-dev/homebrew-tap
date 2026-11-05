class Pcre2 < Formula
  desc "Perl compatible regular expressions library with a new API"
  homepage "https://www.pcre.org/"
  url "https://github.com/PCRE2Project/pcre2/releases/download/pcre2-10.49/pcre2-10.49.tar.bz2"
  version "10.49"
  sha256 "53c156e1ba416a20da8e65395daa132da0d80e76910424caca3fcdae7831d384"

  bottle do
    root_url "https://ghcr.io/v2/homebrew/core"
    sha256 cellar: :any, arm64_golden_gate: "5cac44323243138490ca74a2499fd347fa836df6b5fffa789944be12110e91ff"
    sha256 cellar: :any, arm64_sequoia:     "0ec47d18c50f5770db2b3f07b5b85644284cc6ee8e07e23b11d2727e95932b77"
    sha256 cellar: :any, arm64_tahoe:       "475d36ffae1f472554eac1fd96ca3ead3840c3d8fd2d34b257d2d7c4c1e5a17f"
  end

  def install
    odie "Quill tap is bottle-only; this macOS/architecture has no pinned bottle"
  end

  test do
    assert_path_exists prefix
  end
end
