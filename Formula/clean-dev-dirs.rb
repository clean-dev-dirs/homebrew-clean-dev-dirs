class CleanDevDirs < Formula
  desc "A fast CLI tool for recursively cleaning development build directories to reclaim disk space"
  homepage "https://github.com/clean-dev-dirs/clean-dev-dirs"
  url "https://github.com/clean-dev-dirs/clean-dev-dirs/archive/refs/tags/v2.7.0.tar.gz"
  sha256 "4cd3f12e0e059bd17e8bdd84b2e2d791d66f0bd29a362c9e23aeed7f2e5694b2"
  license "Apache-2.0 OR MIT"
  version "2.7.0"

  bottle do
    root_url "https://tomplanche.com/api/brew/track/clean-dev-dirs"
    sha256 cellar: :any_skip_relocation, arm64_sequoia: "884c144230e479056e553d4b5815f33ac958500d1fa1be51001a7df960cc54fb"
    sha256 cellar: :any_skip_relocation, sequoia:       "3fde261410806ec42a3fa0017cd0690b6de84fac7647a18697c9a279b864f839"
    sha256 cellar: :any_skip_relocation, x86_64_linux:  "2b38543822e62baf2d328c374af3710a400030c4a861e3b6d3a594618b999121"
  end

  depends_on "rust" => :build

  def install
    system "cargo", "install", *std_cargo_args
  end

  test do
    assert_match "clean-dev-dirs 2.7.0", shell_output("#{bin}/clean-dev-dirs --version")
  end
end
