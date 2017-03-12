require "language/go"

class Serulian < Formula
  desc "Serulian compiler and toolkit"
  homepage "http://serulian.io"
  url "https://github.com/Serulian/compiler.git"
  head "https://github.com/Serulian/compiler.git"
  version "alpha"

  depends_on "go" => :build

  def install
    mkdir_p buildpath/"src/github.com/Serulian"
    ln_s buildpath, buildpath/"src/github.com/Serulian/compiler"

    ENV["GOPATH"] = buildpath

    system "go", "get", "github.com/Serulian/compiler/cmd/serulian"
    system "go", "build", "github.com/Serulian/compiler/cmd/serulian"

    bin.install "serulian"
  end
end