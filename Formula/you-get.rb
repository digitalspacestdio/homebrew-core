class YouGet < Formula
  include Language::Python::Virtualenv

  desc "Dumb downloader that scrapes the web"
  homepage "https://you-get.org/"
  url "https://files.pythonhosted.org/packages/f1/e9/3b6f38f800602f9724b3e5b1bf0350e397a0092a3f1fa698e0aeb173122f/you-get-0.4.1555.tar.gz"
  sha256 "99282aca720c7ee1d9ef4b63bbbd226e906ea170b789a459fafd5b0627b0b15f"
  license "MIT"
  head "https://github.com/soimort/you-get.git", branch: "develop"

  bottle do
    sha256 cellar: :any_skip_relocation, arm64_monterey: "6a5815fd852b5a3873a6dad9239abf5550e7a896977e639c4baaa1942a0ee63e"
    sha256 cellar: :any_skip_relocation, arm64_big_sur:  "6a5815fd852b5a3873a6dad9239abf5550e7a896977e639c4baaa1942a0ee63e"
    sha256 cellar: :any_skip_relocation, monterey:       "93d57fa6a700fe99031f1e3d2522a519861943ee27e221e44cc04ad91a920f84"
    sha256 cellar: :any_skip_relocation, big_sur:        "93d57fa6a700fe99031f1e3d2522a519861943ee27e221e44cc04ad91a920f84"
    sha256 cellar: :any_skip_relocation, catalina:       "93d57fa6a700fe99031f1e3d2522a519861943ee27e221e44cc04ad91a920f84"
    sha256 cellar: :any_skip_relocation, x86_64_linux:   "1719895811cae0a2eeb1aa96440b81aa382a04f39d1509ba818d5633c7588d38"
  end

  depends_on "python@3.10"
  depends_on "rtmpdump"

  def install
    virtualenv_install_with_resources
  end

  def caveats
    "To use post-processing options, run `brew install ffmpeg` or `brew install libav`."
  end

  test do
    system bin/"you-get", "--info", "https://youtu.be/he2a4xK8ctk"
  end
end
