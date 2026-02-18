class CleanDevDirs < Formula
  desc "A fast CLI tool for recursively cleaning development build directories to reclaim disk space"
  homepage "https://github.com/clean-dev-dirs/clean-dev-dirs"
  url "https://github.com/clean-dev-dirs/clean-dev-dirs/archive/refs/tags/v2.5.0.tar.gz"
  sha256 "73975f6ea02b57ac8e63e504a7dfc603b50eaddc6f8c03ca288c308d1715911f"
  license "Apache-2.0 OR MIT"
  version "2.5.0"

  bottle do
    root_url "https://tomplanche.com/api/brew/track/clean-dev-dirs"
    sha256 cellar: :any_skip_relocation, arm64_sequoia: "PLACEHOLDER_ARM64_SEQUOIA"
    sha256 cellar: :any_skip_relocation, sequoia:       "PLACEHOLDER_SEQUOIA"
    sha256 cellar: :any_skip_relocation, x86_64_linux:  "PLACEHOLDER_X86_64_LINUX"
  end

  depends_on "rust" => :build

  def install
    system "cargo", "install", *std_cargo_args
  end

  test do
    assert_match "clean-dev-dirs 2.5.0", shell_output("#{bin}/clean-dev-dirs --version")
  end
end
