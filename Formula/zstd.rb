class Zstd < Formula
  desc "Zstandard is a real-time compression algorithm"
  homepage "https://facebook.github.io/zstd/"
  url "https://github.com/facebook/zstd/archive/refs/tags/v1.5.7.tar.gz"
  version "1.5.7"
  sha256 "37d7284556b20954e56e1ca85b80226768902e2edabd3b649e9e72c0c9012ee3"
  revision 1

  bottle do
    root_url "https://ghcr.io/v2/homebrew/core"
    sha256 cellar: :any, arm64_golden_gate: "7fb4af03304cc4897326168cdcd53290311c5543150f5502a61c3e84b6d62765"
    sha256 cellar: :any, arm64_sequoia:     "d72adf48460a8384b256f88061cd7b9df4977df7fa2e0794051d427db754a565"
    sha256 cellar: :any, arm64_sonoma:      "35b5150b27512a94ebaee7b4399aaa8adf42d247e6968319e4aeac3c05365281"
    sha256 cellar: :any, arm64_tahoe:       "628a4ef53428d0078e3d76d297171ce8d0294f5ec1de3f20305e08c4dd333565"
    sha256 cellar: :any, sequoia:           "8b2443dfa62b9d28cf0321e0e670bb096b2680fe72739999228291f36018311f"
    sha256 cellar: :any, sonoma:            "8b8656acd6f30bcbbb9a033ae840afea299c9f0852f71b7540492b0fe7a36742"
    sha256 cellar: :any, tahoe:             "90c345a174a631a157f7ea056fe41205fb77778e65d4bdc91097a3fb3a62faa6"
  end

  depends_on "hotchi-dev/tap/lz4"
  depends_on "hotchi-dev/tap/xz"

  def install
    odie "Quill tap is bottle-only; this macOS/architecture has no pinned bottle"
  end

  test do
    assert_path_exists prefix
  end
end
