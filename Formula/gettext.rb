class Gettext < Formula
  desc "GNU internationalization (i18n) and localization (l10n) library"
  homepage "https://www.gnu.org/software/gettext/"
  url "https://ftpmirror.gnu.org/gettext/gettext-1.0.tar.gz"
  sha256 "85d99b79c981a404874c02e0342176cf75c7698e2b51fe41031cf6526d974f1a"

  bottle do
    root_url "https://ghcr.io/v2/homebrew/core"
    rebuild 2
    sha256 cellar: "/opt/homebrew/Cellar", arm64_golden_gate: "4db034aa2ae4b1f18d86906707ece14c895198090ad028d2fb1ae4fbeb3ca6fd"
    sha256 cellar: "/opt/homebrew/Cellar", arm64_sequoia:     "98a116d35792ccd730360ffc8c0d8fc5799b2282b96bb7696192c573f064a331"
    sha256 cellar: "/opt/homebrew/Cellar", arm64_tahoe:       "3af5392939e50a6ef73e42799fc3ead6ef72fe0040c0a45183d04a4008306d6a"
  end

  depends_on "hotchi-dev/tap/json-c"
  depends_on "hotchi-dev/tap/libunistring"

  def install
    odie "Quill tap is bottle-only; this macOS/architecture has no pinned bottle"
  end

  test do
    assert_path_exists prefix
  end
end
