class Libssh2 < Formula
  desc "C library implementing the SSH2 protocol"
  homepage "https://libssh2.org/"
  url "https://libssh2.org/download/libssh2-1.11.1.tar.gz"
  version "1.11.1"
  sha256 "d9ec76cbe34db98eec3539fe2c899d26b0c837cb3eb466a56b0f109cabf658f7"
  revision 7

  bottle do
    root_url "https://ghcr.io/v2/homebrew/core"
    sha256 cellar: :any, arm64_golden_gate: "5556a728575577915ed43171a3881c8aeed3d0d62c24d1eb13798f8a6a03834d"
    sha256 cellar: :any, arm64_sequoia:     "e0cd7666188510728b2e133ddfab7357437f4df5c347dfbe12cc89d8c06bd2ee"
    sha256 cellar: :any, arm64_tahoe:       "d51f26fef662c9f562f8d6bee348c9e9fdd2a917cc96bb1b26aa53116b9e7481"
  end

  depends_on "hotchi-dev/tap/openssl@4"

  def install
    odie "Quill tap is bottle-only; this macOS/architecture has no pinned bottle"
  end

  test do
    assert_path_exists prefix
  end
end
