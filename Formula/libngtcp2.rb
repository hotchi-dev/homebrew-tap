class Libngtcp2 < Formula
  desc "IETF QUIC protocol implementation"
  homepage "https://nghttp2.org/ngtcp2/"
  url "https://github.com/ngtcp2/ngtcp2/releases/download/v1.26.0/ngtcp2-1.26.0.tar.xz"
  version "1.26.0"
  sha256 "7804aa0fa1c39942ba322a90805824c37231f7675b08d0c3cc4332858a7b085e"

  bottle do
    root_url "https://ghcr.io/v2/homebrew/core"
    sha256 cellar: :any, arm64_golden_gate: "d65b079eb551262a42e0087b2324c468f3787d2a43b7ff8ea46c61f31b59d1e2"
    sha256 cellar: :any, arm64_sequoia:     "ee6c605ea834e91eb3a47c1dc64bf49f005b9f6053eaf9d549ba883a1f80ceef"
    sha256 cellar: :any, arm64_tahoe:       "c1face4d23af05416918430026ba50211f85f60bd37c48250eb306a1bcec6f36"
  end

  depends_on "hotchi-dev/tap/openssl@4"

  def install
    odie "Quill tap is bottle-only; this macOS/architecture has no pinned bottle"
  end

  test do
    assert_path_exists prefix
  end
end
