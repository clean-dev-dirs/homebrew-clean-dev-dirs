class CleanDevDirs < Formula
  desc "A fast CLI tool for recursively cleaning development build directories to reclaim disk space"
  homepage "https://github.com/clean-dev-dirs/clean-dev-dirs"
  url "https://github.com/clean-dev-dirs/clean-dev-dirs/archive/refs/tags/v2.5.1.tar.gz"
  sha256 "5aca6f0a5f3b952a323475134f3b50c2f6a154e1fa3a89dd295953546deea04a"
  license "Apache-2.0 OR MIT"
  version "2.5.1"

  bottle do
    root_url "https://tomplanche.com/api/brew/track/clean-dev-dirs"
    sha256 cellar: :any_skip_relocation, arm64_sequoia: "88845a2fe83e20577d92affb6f0f70a0a45f2c0dfe1b2f291ec11a427285c52a"
    sha256 cellar: :any_skip_relocation, sequoia:       "1e0fae0c429488bf36be7f78c92fb74c81cc0a3664fee48a897faa25d996b609"
    sha256 cellar: :any_skip_relocation, x86_64_linux:  "9f4fed36ddb4bbb6d9ab31ff805f7e3225138058b1eea1f383b0d3bf13fa4989"
  end

  depends_on "rust" => :build

  def install
    system "cargo", "install", *std_cargo_args
  end

  test do
    assert_match "clean-dev-dirs 2.5.1", shell_output("#{bin}/clean-dev-dirs --version")
  end
end
