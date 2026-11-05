class Xz < Formula
  desc "General-purpose data compression with high compression ratio"
  homepage "https://tukaani.org/xz/"
  url "https://github.com/tukaani-project/xz/releases/download/v5.8.4/xz-5.8.4.tar.gz"
  sha256 "0014c7886930454fe8bd4228665b51af55eeae560ea135c9c4cd33f55b2591d9"

  bottle do
    root_url "https://ghcr.io/v2/homebrew/core"
    sha256 cellar: :any, arm64_golden_gate: "b2b5d6523153be05c20bcc51cd358ea3dd1f4bf893748fdedb779ab508ea63ce"
    sha256 cellar: :any, arm64_sequoia:     "c2724c0db0398134694b8366d30d14f4de376115fb54c559c331d5fd0474af76"
    sha256 cellar: :any, arm64_tahoe:       "d291ad2277682238329b0e4d249e5e2c948c4b10cd64dba1963d897330ad88dd"
  end

  def install
    odie "Quill tap is bottle-only; this macOS/architecture has no pinned bottle"
  end

  test do
    assert_path_exists prefix
  end
end
