class Go < Formula
  desc "Open source programming language to build simple/reliable/efficient software"
  homepage "https://go.dev/"
  url "https://go.dev/dl/go1.27.3.src.tar.gz"
  version "1.27.3"
  sha256 "6e7749035cf360f06b2575d162ea79df9fda8ef671889e5c375f8e50777f26bb"

  bottle do
    root_url "https://ghcr.io/v2/homebrew/core"
    sha256 cellar: :any_skip_relocation, arm64_golden_gate: "c7bf84a6f727873581b3e1b5f79c1254cd5856f1241534e2f6943a8acc193e6e"
    sha256 cellar: :any_skip_relocation, arm64_sequoia:     "c7bf84a6f727873581b3e1b5f79c1254cd5856f1241534e2f6943a8acc193e6e"
    sha256 cellar: :any_skip_relocation, arm64_tahoe:       "c7bf84a6f727873581b3e1b5f79c1254cd5856f1241534e2f6943a8acc193e6e"
  end

  def install
    odie "Quill tap is bottle-only; this macOS/architecture has no pinned bottle"
  end

  test do
    assert_path_exists prefix
  end
end
