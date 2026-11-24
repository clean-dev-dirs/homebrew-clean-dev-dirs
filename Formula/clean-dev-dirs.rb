class CleanDevDirs < Formula
  desc "A fast CLI tool for recursively cleaning development build directories to reclaim disk space"
  homepage "https://git.tomplanche.com/clean-dev-dirs/clean-dev-dirs"
  url "https://github.com/clean-dev-dirs/clean-dev-dirs/archive/refs/tags/v2.9.1.tar.gz"
  sha256 "fd16d654938a14bbd725f55c7a8808ffb71c904ccee7e5d23fe6b54f34299410"
  license "Apache-2.0 OR MIT"
  version "2.9.1"

  bottle do
    root_url "https://tomplanche.com/api/brew/track/clean-dev-dirs"
    sha256 cellar: :any_skip_relocation, arm64_sequoia: "694ff5d11722e87a0597aca28227e7847656bafe85b1fb9df3ef92782f3abb1d"
    sha256 cellar: :any_skip_relocation, sequoia:       "29a78a3f0ec9933abca3004cb64f2b98b3c54a9dbadd5732b5baae08b586246e"
    sha256 cellar: :any_skip_relocation, x86_64_linux:  "305e01dd2ad4976afe3da22f51fd04181c3e0e8063311e1348ecbf74196fcc75"
  end

  depends_on "rust" => :build

  def install
    system "cargo", "install", *std_cargo_args
  end

  test do
    assert_match "clean-dev-dirs 2.9.1", shell_output("#{bin}/clean-dev-dirs --version")
  end
end
