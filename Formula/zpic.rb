# This file is a template source-of-truth for the Homebrew tap formula.
# The release workflow renders a concrete copy with versioned URLs and
# checksums, then uploads it as a release asset named `zpic.rb`.

class Zpic < Formula
  desc "Rust-native image hosting CLI compatible with PicGo configuration"
  homepage "https://github.com/xtcel/zpic"
  url "https://github.com/xtcel/zpic/releases/download/v0.2.2/zpic-v0.2.2-source.tar.gz"
  sha256 "ad6447a093376122c427221c5f5585823a79d504caa4755439e2479bbf15e00e"
  license any_of: ["MIT", "Apache-2.0"]

  depends_on "rust" => :build

  def install
    system "cargo", "install", *std_cargo_args(path: "crates/zpic-cli")
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/zpic --version")
  end
end
