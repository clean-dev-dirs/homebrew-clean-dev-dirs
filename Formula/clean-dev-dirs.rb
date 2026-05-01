class CleanDevDirs < Formula
  desc "A fast CLI tool for recursively cleaning development build directories to reclaim disk space"
  homepage "https://github.com/clean-dev-dirs/clean-dev-dirs"
  url "https://github.com/clean-dev-dirs/clean-dev-dirs/archive/refs/tags/v2.8.1.tar.gz"
  sha256 "1eff9ca49518c38b86b1df6836c489c3a6e77cbb0fae60bca9adf4fb7ec18407"
  license "Apache-2.0 OR MIT"
  version "2.8.1"

  bottle do
    root_url "https://tomplanche.com/api/brew/track/clean-dev-dirs"
    sha256 cellar: :any_skip_relocation, arm64_sequoia: "333a3e6d74951b7c67972a412c97d380f479394af0a82b43f143dbbcc41b05ec"
    sha256 cellar: :any_skip_relocation, sequoia:       "28147452c467ec1af3341964b09805a2253faa370012929ebce6d5b008b0e7f1"
    sha256 cellar: :any_skip_relocation, x86_64_linux:  "172df300015f903a941c4d979c066ffe062238bc1a48a19519c6b7536a26617f"
  end

  depends_on "rust" => :build

  def install
    system "cargo", "install", *std_cargo_args
  end

  test do
    assert_match "clean-dev-dirs 2.8.1", shell_output("#{bin}/clean-dev-dirs --version")
  end
end
