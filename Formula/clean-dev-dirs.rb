class CleanDevDirs < Formula
  desc "A fast CLI tool for recursively cleaning development build directories to reclaim disk space"
  homepage "https://github.com/clean-dev-dirs/clean-dev-dirs"
  url "https://github.com/clean-dev-dirs/clean-dev-dirs/archive/refs/tags/v2.5.6.tar.gz"
  sha256 "690ba529518ea666de71b99380abda8ca11fce452de705324944eb19ca7ca660"
  license "Apache-2.0 OR MIT"
  version "2.5.6"

  bottle do
    root_url "https://tomplanche.com/api/brew/track/clean-dev-dirs"
    sha256 cellar: :any_skip_relocation, arm64_sequoia: "910d2da75d50d5008dc037ec2525ce2ce18eba26f1432763233a0bd25f173f96"
    sha256 cellar: :any_skip_relocation, sequoia:       "af96cb97ac20d21be3914205a3fac69ff5e6079595783f1951b7d2fb3a7a4f3b"
    sha256 cellar: :any_skip_relocation, x86_64_linux:  "f46f54625f54034916911f1378e7a2b8012be8051a347b740fe73428541f1e9c"
  end

  depends_on "rust" => :build

  def install
    system "cargo", "install", *std_cargo_args
  end

  test do
    assert_match "clean-dev-dirs 2.5.6", shell_output("#{bin}/clean-dev-dirs --version")
  end
end
