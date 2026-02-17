class CleanDevDirs < Formula
  desc "A fast CLI tool for recursively cleaning development build directories to reclaim disk space"
  homepage "https://github.com/clean-dev-dirs/clean-dev-dirs"
  url "https://github.com/clean-dev-dirs/clean-dev-dirs/archive/refs/tags/v2.5.0.tar.gz"
  sha256 "PLACEHOLDER_SHA256"
  license "Apache-2.0 OR MIT"
  version "2.5.0"

  depends_on "rust" => :build

  def install
    system "cargo", "install", *std_cargo_args
  end

  test do
    assert_match "clean-dev-dirs 2.5.0", shell_output("#{bin}/clean-dev-dirs --version")
  end
end
