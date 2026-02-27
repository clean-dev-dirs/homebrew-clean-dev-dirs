class CleanDevDirs < Formula
  desc "A fast CLI tool for recursively cleaning development build directories to reclaim disk space"
  homepage "https://github.com/clean-dev-dirs/clean-dev-dirs"
  url "https://github.com/clean-dev-dirs/clean-dev-dirs/archive/refs/tags/v2.5.5.tar.gz"
  sha256 "271f5a12dd56ff14646da036e22a54ec7fb10c2a5d3664f2e49faed08ef95195"
  license "Apache-2.0 OR MIT"
  version "2.5.5"

  bottle do
    root_url "https://tomplanche.com/api/brew/track/clean-dev-dirs"
    sha256 cellar: :any_skip_relocation, arm64_sequoia: "53bfedb68a2bcd2a989bf91ca40cbfd304b33eb169fd192458edbbad8b921f39"
    sha256 cellar: :any_skip_relocation, sequoia:       "e63b962c917b3b5f16ee41e31718215a74c920b29f554080cd30197171bc8b66"
    sha256 cellar: :any_skip_relocation, x86_64_linux:  "9946cfd0129d3535e47684e0e5389fc65d3b8e03ae3134e1857a3a3508c3b686"
  end

  depends_on "rust" => :build

  def install
    system "cargo", "install", *std_cargo_args
  end

  test do
    assert_match "clean-dev-dirs 2.5.5", shell_output("#{bin}/clean-dev-dirs --version")
  end
end
