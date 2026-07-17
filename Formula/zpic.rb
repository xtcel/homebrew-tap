# This file is a template source-of-truth for the Homebrew tap formula.
# The release workflow renders a concrete copy with versioned URLs and
# per-platform checksums, then uploads it as a release asset named
# `zpic.rb`. It installs the prebuilt binary for the running platform
# instead of compiling from source, so it does not pull in a Rust/LLVM
# toolchain on the end user's machine.

class Zpic < Formula
  desc "Rust-native image hosting CLI compatible with PicGo configuration"
  homepage "https://github.com/xtcel/zpic"
  version "0.2.3"
  license any_of: ["MIT", "Apache-2.0"]

  on_macos do
    on_arm do
      url "https://github.com/xtcel/zpic/releases/download/v0.2.3/zpic-v0.2.3-aarch64-apple-darwin.tar.gz"
      sha256 "e9e3aef2a5be8ebfed45439fb61670f5d361317c00c6f5dbe2c1d477292fff7c"
    end
    on_intel do
      url "https://github.com/xtcel/zpic/releases/download/v0.2.3/zpic-v0.2.3-x86_64-apple-darwin.tar.gz"
      sha256 "d1fe80a30c9e13da0e3f1c3025b64ab3ba7a7744a9d16957dfe56fcff8147bb6"
    end
  end

  on_linux do
    url "https://github.com/xtcel/zpic/releases/download/v0.2.3/zpic-v0.2.3-x86_64-unknown-linux-gnu.tar.gz"
    sha256 "28452ae12b05b8f4de607015d3692bfdf605e6742397a33a4978d597bcbd6878"
  end

  def install
    bin.install "zpic"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/zpic --version")
  end
end
