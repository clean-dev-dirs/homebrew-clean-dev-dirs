class CleanDevDirs < Formula
  desc "A fast CLI tool for recursively cleaning development build directories to reclaim disk space"
  homepage "https://github.com/clean-dev-dirs/clean-dev-dirs"
  url "https://github.com/clean-dev-dirs/clean-dev-dirs/archive/refs/tags/v2.5.2.tar.gz"
  sha256 "ae293bbb26f66dc29a2645cefd7a7fef991d9f8bf34f21b5fc7036bbd58e562c"
  license "Apache-2.0 OR MIT"
  version "2.5.2"

  bottle do
    root_url "https://tomplanche.com/api/brew/track/clean-dev-dirs"
    sha256 cellar: :any_skip_relocation, arm64_sequoia: "3c585b8747ff51820050ec1632009041e3937bf62c67b892b1fe955b2d932849"
    sha256 cellar: :any_skip_relocation, sequoia:       "b1d5b4ea273c23c563852370759ba65f9b4f542b643b76d4c9c99ae153230184"
    sha256 cellar: :any_skip_relocation, x86_64_linux:  "38105747c68faafed9fb94e4175b20a7b56254923beea4e2a31b9cef02df9525"
  end

  depends_on "rust" => :build

  def install
    system "cargo", "install", *std_cargo_args
  end

  test do
    assert_match "clean-dev-dirs 2.5.2", shell_output("#{bin}/clean-dev-dirs --version")
  end
end
