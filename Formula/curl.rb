class Curl < Formula
  desc "Get a file from an HTTP, HTTPS or FTP server"
  homepage "https://curl.se"
  url "https://curl.se/download/curl-8.23.0.tar.bz2"
  version "8.23.0"
  sha256 "95b22eb32bf6d1fa6e3e9463bdb61cece3efc56d86576a9b3cbd428246a6d854"

  bottle do
    root_url "https://ghcr.io/v2/homebrew/core"
    sha256 cellar: :any, arm64_golden_gate: "16b951fa8ecede2c254441c26e34814fed37c1e97382dad3016012aa2cbf20ac"
    sha256 cellar: :any, arm64_sequoia:     "d0245613b94f81fbb069090f4310a6a0c71830a3bf6b3f14ebef30c6ae49b957"
    sha256 cellar: :any, arm64_tahoe:       "44771918de230a1767855f3e6623b280c4e1b238a431e997bec8fc53b8bd8f74"
  end

  depends_on "hotchi-dev/tap/brotli"
  depends_on "hotchi-dev/tap/libnghttp2"
  depends_on "hotchi-dev/tap/libnghttp3"
  depends_on "hotchi-dev/tap/libngtcp2"
  depends_on "hotchi-dev/tap/libpsl"
  depends_on "hotchi-dev/tap/libssh2"
  depends_on "hotchi-dev/tap/openssl@4"
  depends_on "hotchi-dev/tap/zstd"

  def install
    odie "Quill tap is bottle-only; this macOS/architecture has no pinned bottle"
  end

  test do
    assert_path_exists prefix
  end
end
