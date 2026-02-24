class CleanDevDirs < Formula
  desc "A fast CLI tool for recursively cleaning development build directories to reclaim disk space"
  homepage "https://github.com/clean-dev-dirs/clean-dev-dirs"
  url "https://github.com/clean-dev-dirs/clean-dev-dirs/archive/refs/tags/v2.5.3.tar.gz"
  sha256 "2653466984791e5fe66e5601a8856bc3b57641bb5ef2521ab019457eaf48c380"
  license "Apache-2.0 OR MIT"
  version "2.5.3"

  bottle do
    root_url "https://tomplanche.com/api/brew/track/clean-dev-dirs"
    sha256 cellar: :any_skip_relocation, arm64_sequoia: "8429ebd4077a5a91fdf06a6801fe0a7e27aaec3fd9ddb378bcf647d04beff422"
    sha256 cellar: :any_skip_relocation, sequoia:       "d070a186ed58ef346ed4d02931d1564f11e67aa071b19a3329a3be30a0655215"
    sha256 cellar: :any_skip_relocation, x86_64_linux:  "fd0806f768cc11acc965a7de241e3dc2a7744dacbc174fd0170a9b1e843a7a07"
  end

  depends_on "rust" => :build

  def install
    system "cargo", "install", *std_cargo_args
  end

  test do
    assert_match "clean-dev-dirs 2.5.3", shell_output("#{bin}/clean-dev-dirs --version")
  end
end
