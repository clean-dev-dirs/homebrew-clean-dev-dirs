class CleanDevDirs < Formula
  desc "A fast CLI tool for recursively cleaning development build directories to reclaim disk space"
  homepage "https://github.com/clean-dev-dirs/clean-dev-dirs"
  url "https://github.com/clean-dev-dirs/clean-dev-dirs/archive/refs/tags/v2.8.0.tar.gz"
  sha256 "0de97cfebbff684ebbe091cd89b943ffeab15da5aa3ea2640f11190c726577d1"
  license "Apache-2.0 OR MIT"
  version "2.8.0"

  bottle do
    root_url "https://tomplanche.com/api/brew/track/clean-dev-dirs"
    sha256 cellar: :any_skip_relocation, arm64_sequoia: "3b138511e93d59e347180f927b7a7d9bf3d2a4575fba0b849b471ed47fbb2a1c"
    sha256 cellar: :any_skip_relocation, sequoia:       "2e0928bede6b9c2069e9971545b2a86e3f62e43189eb662c63f04cffc8952eca"
    sha256 cellar: :any_skip_relocation, x86_64_linux:  "d06ef52b86a025693eb647f8097c488ded305f92be62cba5c4e539cf127c7290"
  end

  depends_on "rust" => :build

  def install
    system "cargo", "install", *std_cargo_args
  end

  test do
    assert_match "clean-dev-dirs 2.8.0", shell_output("#{bin}/clean-dev-dirs --version")
  end
end
