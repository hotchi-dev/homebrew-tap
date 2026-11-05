class Lz4 < Formula
  desc "Extremely Fast Compression algorithm"
  homepage "https://lz4.github.io/lz4/"
  url "https://github.com/lz4/lz4/archive/refs/tags/v1.11.0.tar.gz"
  version "1.11.0"
  sha256 "247e5fa64da5f7b75ee3dd3bed484076396c9ebe8254d9ccf693eb62800c5e26"

  bottle do
    root_url "https://ghcr.io/v2/homebrew/core"
    sha256 cellar: :any, arm64_golden_gate: "464d0e2782c24627a2ffa99093daaf8a7f9e2acbdae1ac4587d8724b85f2dbf9"
    sha256 cellar: :any, arm64_sequoia:     "8c311d5e93bca17d53f8225dd8fabbb2626fa6ade09ff5713e3b85d428fec3bf"
    sha256 cellar: :any, arm64_tahoe:       "f25384fe48be399693954cf6b1b48da50ae795a29058ca7abfe91fc4c3e8b623"
  end

  def install
    odie "Quill tap is bottle-only; this macOS/architecture has no pinned bottle"
  end

  test do
    assert_path_exists prefix
  end
end
