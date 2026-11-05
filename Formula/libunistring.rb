class Libunistring < Formula
  desc "C string library for manipulating Unicode strings"
  homepage "https://www.gnu.org/software/libunistring/"
  url "https://ftpmirror.gnu.org/libunistring/libunistring-1.5.tar.gz"
  sha256 "5b0ecd46cbf225375f20ab4056197e66a7ac590e2684c069af407ae3383c9d81"

  bottle do
    root_url "https://ghcr.io/v2/homebrew/core"
    sha256 cellar: :any, arm64_golden_gate: "fec6be46cabaefd1dc5d5ecd029c50aeaef6c93d9c7de4425968047811575e81"
    sha256 cellar: :any, arm64_sequoia:     "5001abe192babcfaf0f97ad322e2e59958d0d991de3da9f2e941b24924b8a2b8"
    sha256 cellar: :any, arm64_tahoe:       "b803434415743b204ffc6bc5415ebfceeaf3dbcb86c0c4ea8a6fc63d2a04f441"
  end

  def install
    odie "Quill tap is bottle-only; this macOS/architecture has no pinned bottle"
  end

  test do
    assert_path_exists prefix
  end
end
