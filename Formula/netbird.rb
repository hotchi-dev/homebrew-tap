class Netbird < Formula
  desc "Securely connects across any network with one identity-based platform"
  homepage "https://netbird.io"
  url "https://github.com/netbirdio/netbird/archive/refs/tags/v0.82.0.tar.gz"
  sha256 "9553375fdd487572a4fdfeefd4cce95622686a80b8f0d10077c9913bebefe021"

  bottle do
    root_url "https://ghcr.io/v2/homebrew/core"
    sha256 cellar: :any_skip_relocation, arm64_golden_gate: "d9cda2ea118f6c6b7bdd2c8cb36ed8decc8d5b378bfa69fea558866f575014a1"
    sha256 cellar: :any_skip_relocation, arm64_sequoia:     "d9cda2ea118f6c6b7bdd2c8cb36ed8decc8d5b378bfa69fea558866f575014a1"
    sha256 cellar: :any_skip_relocation, arm64_tahoe:       "d9cda2ea118f6c6b7bdd2c8cb36ed8decc8d5b378bfa69fea558866f575014a1"
  end

  def install
    odie "Quill tap is bottle-only; this macOS/architecture has no pinned bottle"
  end

  test do
    assert_path_exists prefix
  end
end
