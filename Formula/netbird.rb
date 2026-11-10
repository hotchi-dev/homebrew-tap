class Netbird < Formula
  desc "Securely connects across any network with one identity-based platform"
  homepage "https://netbird.io"
  url "https://github.com/netbirdio/netbird/archive/refs/tags/v0.82.1.tar.gz"
  sha256 "faea65ed0321a285818ad4458da5b0441c6f6f766c9fd963cb7dfc5cd9bf4445"

  bottle do
    root_url "https://ghcr.io/v2/homebrew/core"
    sha256 cellar: :any_skip_relocation, arm64_golden_gate: "6a02bf0700c0bfd7e5f744612efe04c13a04f3ec8f4eada6e734dbe8624ae0a4"
    sha256 cellar: :any_skip_relocation, arm64_sequoia:     "6a02bf0700c0bfd7e5f744612efe04c13a04f3ec8f4eada6e734dbe8624ae0a4"
    sha256 cellar: :any_skip_relocation, arm64_tahoe:       "6a02bf0700c0bfd7e5f744612efe04c13a04f3ec8f4eada6e734dbe8624ae0a4"
  end

  def install
    odie "Quill tap is bottle-only; this macOS/architecture has no pinned bottle"
  end

  test do
    assert_path_exists prefix
  end
end
