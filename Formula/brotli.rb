class Brotli < Formula
  desc "Generic-purpose lossless compression algorithm by Google"
  homepage "https://github.com/google/brotli"
  url "https://github.com/google/brotli/archive/refs/tags/v1.2.1.tar.gz"
  version "1.2.1"
  sha256 "98d35d11a78dc453aebb7d10c3748f3f73ff78c8267c0dc697b8631f67bf7e8f"

  bottle do
    root_url "https://ghcr.io/v2/homebrew/core"
    sha256 cellar: :any, arm64_golden_gate: "ba4564da654b3cbc6a143d98194a5c0a4971976d5190c5627ed0b76c5c971b8f"
    sha256 cellar: :any, arm64_sequoia:     "7b92f3978056e44ac3f4bb6f5fc1ec31278a6b5972706236e8988e7c255cb3d4"
    sha256 cellar: :any, arm64_tahoe:       "c5a6fba2965b2423acfbf5084a4d8291bf95b96bbc64b534c8ef83a480413e49"
  end

  def install
    odie "Quill tap is bottle-only; this macOS/architecture has no pinned bottle"
  end

  test do
    assert_path_exists prefix
  end
end
