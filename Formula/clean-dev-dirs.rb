class CleanDevDirs < Formula
  desc "A fast CLI tool for recursively cleaning development build directories to reclaim disk space"
  homepage "https://github.com/clean-dev-dirs/clean-dev-dirs"
  url "https://github.com/clean-dev-dirs/clean-dev-dirs/archive/refs/tags/v2.6.0.tar.gz"
  sha256 "6f0e962841fa0ce61834b68f3551a22e98b94b1748bc1df7b86a10545a2b6396"
  license "Apache-2.0 OR MIT"
  version "2.6.0"

  bottle do
    root_url "https://tomplanche.com/api/brew/track/clean-dev-dirs"
    sha256 cellar: :any_skip_relocation, arm64_sequoia: "29fcea24dae401447cbedcfba3d9a653f2b5c2f2ed3ac113859dbbaf42996416"
    sha256 cellar: :any_skip_relocation, sequoia:       "260c0643b9737578ceb61eb8033c2f68934147f2774370dfef8b7c5c7da8e84e"
    sha256 cellar: :any_skip_relocation, x86_64_linux:  "c51e65ee53c5ef6f1f6190c99b733d24907e549861145516c26335386380d10e"
  end

  depends_on "rust" => :build

  def install
    system "cargo", "install", *std_cargo_args
  end

  test do
    assert_match "clean-dev-dirs 2.6.0", shell_output("#{bin}/clean-dev-dirs --version")
  end
end
