class CleanDevDirs < Formula
  desc "A fast CLI tool for recursively cleaning development build directories to reclaim disk space"
  homepage "https://github.com/clean-dev-dirs/clean-dev-dirs"
  url "https://github.com/clean-dev-dirs/clean-dev-dirs/archive/refs/tags/v2.8.2.tar.gz"
  sha256 "efb868f0f9f7b15729ef3f7a123f132642d0c071fb33fddd11eef83b7f24a17c"
  license "Apache-2.0 OR MIT"
  version "2.8.2"

  bottle do
    root_url "https://tomplanche.com/api/brew/track/clean-dev-dirs"
    sha256 cellar: :any_skip_relocation, arm64_sequoia: "a587e16372b7bf24be3ef87e44123de072e64f772dc069bbea7e76f3a61af8b2"
    sha256 cellar: :any_skip_relocation, sequoia:       "af80f0b1a596fabd994b7712ea980d3f8fd7308a62cfc5612b1e5bcf59e57a76"
    sha256 cellar: :any_skip_relocation, x86_64_linux:  "ae3fa0cd3b232b8f170dd45ad41e91db562ae7a8ca583e97088d1e0d389ea77e"
  end

  depends_on "rust" => :build

  def install
    system "cargo", "install", *std_cargo_args
  end

  test do
    assert_match "clean-dev-dirs 2.8.2", shell_output("#{bin}/clean-dev-dirs --version")
  end
end
