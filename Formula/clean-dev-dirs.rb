class CleanDevDirs < Formula
  desc "A fast CLI tool for recursively cleaning development build directories to reclaim disk space"
  homepage "https://github.com/clean-dev-dirs/clean-dev-dirs"
  url "https://github.com/clean-dev-dirs/clean-dev-dirs/archive/refs/tags/v2.8.3.tar.gz"
  sha256 "0ffbca8fcfa51c2fa1c4c22e2749fd7ae341923333511eb7b3a17d94add2c5d8"
  license "Apache-2.0 OR MIT"
  version "2.8.3"

  bottle do
    root_url "https://tomplanche.com/api/brew/track/clean-dev-dirs"
    sha256 cellar: :any_skip_relocation, arm64_sequoia: "1b13fa7350a29989324f7075dac82cb5ae927d3ba418f3f2c0a4d1e2985881b1"
    sha256 cellar: :any_skip_relocation, sequoia:       "9366a757977667032f947bc3264d228cb766cd02588ee097412d0feece67a85a"
    sha256 cellar: :any_skip_relocation, x86_64_linux:  "f80750bf5704eb91bfe3448f363a15bf034d9b222a2d7c9855961269e071f876"
  end

  depends_on "rust" => :build

  def install
    system "cargo", "install", *std_cargo_args
  end

  test do
    assert_match "clean-dev-dirs 2.8.3", shell_output("#{bin}/clean-dev-dirs --version")
  end
end
