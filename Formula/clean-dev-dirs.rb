class CleanDevDirs < Formula
  desc "A fast CLI tool for recursively cleaning development build directories to reclaim disk space"
  homepage "https://github.com/clean-dev-dirs/clean-dev-dirs"
  url "https://github.com/clean-dev-dirs/clean-dev-dirs/archive/refs/tags/v2.6.2.tar.gz"
  sha256 "6a62ec7f18da981baa9dbfa0250911b25d092aa9df045d4c2a4f6139f0b6a868"
  license "Apache-2.0 OR MIT"
  version "2.6.2"

  bottle do
    root_url "https://tomplanche.com/api/brew/track/clean-dev-dirs"
    sha256 cellar: :any_skip_relocation, arm64_sequoia: "5d3968bf48b3e2ddd6d603907d1fe999cff241e44a1f78dc92bcf58e7d978ce3"
    sha256 cellar: :any_skip_relocation, sequoia:       "a44af91d66010bfef71aec6ae3e55810bb8ce7e3f52d9831410bb632987dae2b"
    sha256 cellar: :any_skip_relocation, x86_64_linux:  "0620fba1452fba02c97efbd822bdafdc35fdde54797405a39815daae42c8580a"
  end

  depends_on "rust" => :build

  def install
    system "cargo", "install", *std_cargo_args
  end

  test do
    assert_match "clean-dev-dirs 2.6.2", shell_output("#{bin}/clean-dev-dirs --version")
  end
end
