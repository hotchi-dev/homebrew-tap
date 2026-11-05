class Libpsl < Formula
  desc "C library for the Public Suffix List"
  homepage "https://rockdaboot.github.io/libpsl"
  url "https://github.com/rockdaboot/libpsl/releases/download/0.23.3/libpsl-0.23.3.tar.gz"
  sha256 "93941f85a1e7bd593fa94f299233cb5dfc91cd144fd9a78a6ceb75001c5b03be"

  bottle do
    root_url "https://ghcr.io/v2/homebrew/core"
    sha256 cellar: :any, arm64_golden_gate: "55221f12796ff26921c5eead5511e2d1f4465c1f8cfc08c164aef8f9e50c9261"
    sha256 cellar: :any, arm64_sequoia:     "392f0aceca4e4febcb583688fa4bb701853e4a41a3d11446b0deac5231c32a53"
    sha256 cellar: :any, arm64_sonoma:      "c26c327af497356f04a3f818da2d073a7f9833a7494231d8808b85599e029bbd"
    sha256 cellar: :any, arm64_tahoe:       "3058120ea617a1ba193463788e81b8afd08fcf0abdbaf0bb5bfa85eebc695761"
    sha256 cellar: :any, sonoma:            "a8461dfee9fad01788669d0afbdcfd92c112708e220c4a8a371c3cfca3da1b8e"
  end

  def install
    odie "Quill tap is bottle-only; this macOS/architecture has no pinned bottle"
  end

  test do
    assert_path_exists prefix
  end
end
