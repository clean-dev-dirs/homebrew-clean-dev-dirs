class CleanDevDirs < Formula
  desc "A fast CLI tool for recursively cleaning development build directories to reclaim disk space"
  homepage "https://github.com/clean-dev-dirs/clean-dev-dirs"
  url "https://github.com/clean-dev-dirs/clean-dev-dirs/archive/refs/tags/v2.5.4.tar.gz"
  sha256 "d719573e63f21e1349b23872ff8d179b7a65dfc0f8e66e626b42e85b3f60969a"
  license "Apache-2.0 OR MIT"
  version "2.5.4"

  bottle do
    root_url "https://tomplanche.com/api/brew/track/clean-dev-dirs"
    sha256 cellar: :any_skip_relocation, arm64_sequoia: "27893883c18328938ae35656e5e67f1315c096b63d9f87fcc959c98b461b8cc7"
    sha256 cellar: :any_skip_relocation, sequoia:       "4e90242f02b1e9d75612730812f4498ba8376d6646b6dad35a00705216a722a2"
    sha256 cellar: :any_skip_relocation, x86_64_linux:  "26651277c66999e9ae530f9da38c088d4951ecddecd458af3a9670ca6c80018f"
  end

  depends_on "rust" => :build

  def install
    system "cargo", "install", *std_cargo_args
  end

  test do
    assert_match "clean-dev-dirs 2.5.4", shell_output("#{bin}/clean-dev-dirs --version")
  end
end
