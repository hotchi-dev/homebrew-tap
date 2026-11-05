class Libnghttp3 < Formula
  desc "HTTP/3 library written in C"
  homepage "https://nghttp2.org/nghttp3/"
  url "https://github.com/ngtcp2/nghttp3/releases/download/v1.19.0/nghttp3-1.19.0.tar.xz"
  version "1.19.0"
  sha256 "228e17f5cc3d4de7bfced9912bd09de30e7f45741cc47503cf88d3fa9209e155"

  bottle do
    root_url "https://ghcr.io/v2/homebrew/core"
    sha256 cellar: :any, arm64_golden_gate: "4aa61da9837c8773e8548bac1f6956446eb5babb5efa70ec02d3955cf7713f43"
    sha256 cellar: :any, arm64_sequoia:     "a7e6e8dadb7a218166d75d2849a7afec01588e27fb53fb18f11d3fce7f1ec853"
    sha256 cellar: :any, arm64_tahoe:       "4d4260baf29ed38e74806c0e66a31e98af6e7afe4d66e0e9d29692d265751141"
  end

  def install
    odie "Quill tap is bottle-only; this macOS/architecture has no pinned bottle"
  end

  test do
    assert_path_exists prefix
  end
end
