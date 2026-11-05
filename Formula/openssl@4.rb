class OpensslAT4 < Formula
  desc "Cryptography and SSL/TLS Toolkit"
  homepage "https://openssl-library.org"
  url "https://github.com/openssl/openssl/releases/download/openssl-4.1.0/openssl-4.1.0.tar.gz"
  version "4.1.0"
  sha256 "50c17baf54cb008f6ce42d50deb4b28050a1aad711636cabd4b241c7e90cc2fd"

  bottle do
    root_url "https://ghcr.io/v2/homebrew/core"
    sha256 cellar: "/opt/homebrew/Cellar", arm64_golden_gate: "d239639f77a275caa217707e126790b3f5f5c86e5bc6e2a996e5df7fdaed44a6"
    sha256 cellar: "/opt/homebrew/Cellar", arm64_sequoia:     "6fcbad388ef13f6f9481e91676e2ec1b49f0a3dbd473e838297a3c8850283978"
    sha256 cellar: "/opt/homebrew/Cellar", arm64_tahoe:       "382f63e829b116d5fb9a2b186147e489631b5bbbb06ac0089f795a3fed1085c4"
  end

  depends_on "hotchi-dev/tap/ca-certificates"

  def install
    odie "Quill tap is bottle-only; this macOS/architecture has no pinned bottle"
  end

  test do
    assert_path_exists prefix
  end
end
