class CleanDevDirs < Formula
  desc "A fast CLI tool for recursively cleaning development build directories to reclaim disk space"
  homepage "https://github.com/clean-dev-dirs/clean-dev-dirs"
  url "https://github.com/clean-dev-dirs/clean-dev-dirs/archive/refs/tags/v2.7.1.tar.gz"
  sha256 "4fce5c694a06ca66759b86b28e934820042ef2e074b7abf227c29c57027659b3"
  license "Apache-2.0 OR MIT"
  version "2.7.1"

  bottle do
    root_url "https://tomplanche.com/api/brew/track/clean-dev-dirs"
    sha256 cellar: :any_skip_relocation, arm64_sequoia: "2e75776e789c7c7f9ce0f3ab47f8ded73249c953b258911d769cb513d284b42f"
    sha256 cellar: :any_skip_relocation, sequoia:       "0a73bfabbf7a7190ea6a3970fc8761721892505a13f93222954f7ad89d68b81f"
    sha256 cellar: :any_skip_relocation, x86_64_linux:  "cd3adfc32bb642e606f89b515fbb4bb43ad1ba9264bddee4e36f917ee29f547c"
  end

  depends_on "rust" => :build

  def install
    system "cargo", "install", *std_cargo_args
  end

  test do
    assert_match "clean-dev-dirs 2.7.1", shell_output("#{bin}/clean-dev-dirs --version")
  end
end
