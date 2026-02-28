class CleanDevDirs < Formula
  desc "A fast CLI tool for recursively cleaning development build directories to reclaim disk space"
  homepage "https://github.com/clean-dev-dirs/clean-dev-dirs"
  url "https://github.com/clean-dev-dirs/clean-dev-dirs/archive/refs/tags/v2.6.3.tar.gz"
  sha256 "bd6ba88f732f1a72521bdbb8d5e79420ec58466412268c45687a21fcd1512ee1"
  license "Apache-2.0 OR MIT"
  version "2.6.3"

  bottle do
    root_url "https://tomplanche.com/api/brew/track/clean-dev-dirs"
    sha256 cellar: :any_skip_relocation, arm64_sequoia: "32b2d69316cd5aa977b1ea8fa18f1ff318a7e7c04c1b5800b9b493ea41eef4b2"
    sha256 cellar: :any_skip_relocation, sequoia:       "13449228ae584f7cf351d1f7addb582fa5c6260bfba9ad9f8bd84659db16c7eb"
    sha256 cellar: :any_skip_relocation, x86_64_linux:  "ecb77cc520929ecf36cf40c6c4a98f32834c912aa55f10a8cb5633056d7a606e"
  end

  depends_on "rust" => :build

  def install
    system "cargo", "install", *std_cargo_args
  end

  test do
    assert_match "clean-dev-dirs 2.6.3", shell_output("#{bin}/clean-dev-dirs --version")
  end
end
