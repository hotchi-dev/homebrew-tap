class JsonC < Formula
  desc "JSON parser for C"
  homepage "https://github.com/json-c/json-c/wiki"
  url "https://s3.amazonaws.com/json-c_releases/releases/json-c-0.19.tar.gz"
  sha256 "37ad0249902e301bd9052bf712e511fcc6acff4ecaad4b5900aad9ce564e26de"

  bottle do
    root_url "https://ghcr.io/v2/homebrew/core"
    rebuild 1
    sha256 cellar: :any, arm64_golden_gate: "6b45746f31780a84ae3ed11d056bd101d1b0a6d0f16bf91aad2d35a18f6107dc"
    sha256 cellar: :any, arm64_sequoia:     "5624048dbb067f1a6d3784081029c3d738edeefd57188ce6724bb93d01aa53aa"
    sha256 cellar: :any, arm64_sonoma:      "ce9c5f6c7095110cd5c9336b9277e1845cc55bb0fc98c7550576587fd28abbb1"
    sha256 cellar: :any, arm64_tahoe:       "f2da9c816501d9c3c0e5f883b60b3d2758b35a3995e20d541d4b029d8b35ef13"
  end

  def install
    odie "Quill tap is bottle-only; this macOS/architecture has no pinned bottle"
  end

  test do
    assert_path_exists prefix
  end
end
