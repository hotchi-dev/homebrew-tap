class CaCertificates < Formula
  desc "Mozilla CA certificate store"
  homepage "https://curl.se/docs/caextract.html"
  url "https://curl.se/ca/cacert-2026-11-05.pem"
  version "2026-11-05"
  sha256 "427c064216761a1e72a8b30f0d954d08cb6e4435a82091fb865afd20c8497285"

  bottle do
    root_url "https://ghcr.io/v2/homebrew/core"
    sha256 cellar: :any_skip_relocation, all: "8a5a35e1a3223e6bc6ca7c853e0ac3d2568de2cc329b61688682bdf57165dab9"
  end

  def install
    odie "Quill tap is bottle-only; this macOS/architecture has no pinned bottle"
  end

  test do
    assert_path_exists prefix
  end
end
