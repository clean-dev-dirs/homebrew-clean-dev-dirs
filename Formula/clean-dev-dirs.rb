class CleanDevDirs < Formula
  desc "A fast CLI tool for recursively cleaning development build directories to reclaim disk space"
  homepage "https://github.com/clean-dev-dirs/clean-dev-dirs"
  url "https://github.com/clean-dev-dirs/clean-dev-dirs/archive/refs/tags/v2.9.0.tar.gz"
  sha256 "7c9ab3448276f6b47771e6f66def4e428d90d1ab0b2ab0166be50202b20903a7"
  license "Apache-2.0 OR MIT"
  version "2.9.0"

  bottle do
    root_url "https://tomplanche.com/api/brew/track/clean-dev-dirs"
    sha256 cellar: :any_skip_relocation, arm64_sequoia: "2c7cb90723d263c595781730727b807ec5900efea965e8f41cb73677c5babea4"
    sha256 cellar: :any_skip_relocation, sequoia:       "a9292a02f569386320fa0607dc9bff5442293ca5f11a4a70db14c09419cf16c9"
    sha256 cellar: :any_skip_relocation, x86_64_linux:  "de80302f5eacfdc83130975739aac110427012db48ca74cf5de88fb091411ca9"
  end

  depends_on "rust" => :build

  def install
    system "cargo", "install", *std_cargo_args
  end

  test do
    assert_match "clean-dev-dirs 2.9.0", shell_output("#{bin}/clean-dev-dirs --version")
  end
end
