class Libnghttp2 < Formula
  desc "HTTP/2 C Library"
  homepage "https://nghttp2.org/"
  url "https://github.com/nghttp2/nghttp2/releases/download/v1.71.0/nghttp2-1.71.0.tar.gz"
  version "1.71.0"
  sha256 "0cdd35ecec77919b4b7b245f87fe8d2216e3d62da854eb0838c594ff058042fc"

  bottle do
    root_url "https://ghcr.io/v2/homebrew/core"
    sha256 cellar: :any, arm64_golden_gate: "d9da888bfcca6b9e1cbf53b84d4664b02e12b38e04032fb985c7e4ff7068acb0"
    sha256 cellar: :any, arm64_sequoia:     "88d1ab4c79c450318c8e65a3070578a533a11eff7dad6d3a4b79c580b0fbe6bb"
    sha256 cellar: :any, arm64_tahoe:       "b666811d826d75ddb25caf4ee321f54cb0a750e050b9857681c2b15538ee13f0"
  end

  def install
    odie "Quill tap is bottle-only; this macOS/architecture has no pinned bottle"
  end

  test do
    assert_path_exists prefix
  end
end
