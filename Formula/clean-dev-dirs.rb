class CleanDevDirs < Formula
  desc "A fast CLI tool for recursively cleaning development build directories to reclaim disk space"
  homepage "https://github.com/clean-dev-dirs/clean-dev-dirs"
  url "https://github.com/clean-dev-dirs/clean-dev-dirs/archive/refs/tags/v2.6.1.tar.gz"
  sha256 "59322f088458ae859cedddc823e873fcc95a543ab28fda6e2d107517bb8300cc"
  license "Apache-2.0 OR MIT"
  version "2.6.1"

  bottle do
    root_url "https://tomplanche.com/api/brew/track/clean-dev-dirs"
    sha256 cellar: :any_skip_relocation, arm64_sequoia: "4b379c5026a1a322a79ccd413226f1415ceba05312009506e7048e137ac1fce0"
    sha256 cellar: :any_skip_relocation, sequoia:       "879bd22a9aeb0b26b2358df98a5e35b02f0fd9bb29e5d97783266350acda0ee7"
    sha256 cellar: :any_skip_relocation, x86_64_linux:  "f3b89c6125debc0a452e64b51f65b38d5e0a22a07d5393933c1bfdecfcab64a9"
  end

  depends_on "rust" => :build

  def install
    system "cargo", "install", *std_cargo_args
  end

  test do
    assert_match "clean-dev-dirs 2.6.1", shell_output("#{bin}/clean-dev-dirs --version")
  end
end
