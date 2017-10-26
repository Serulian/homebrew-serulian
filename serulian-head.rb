require "language/go"

class Serulian < Formula
  desc "Serulian compiler and toolkit"
  homepage "https://serulian.io"
  head "https://github.com/serulian/compiler.git"
  version "head"

  depends_on "go" => :build

  def install
    mkdir_p buildpath/"src/github.com/Serulian"
    ln_s buildpath, buildpath/"src/github.com/serulian/compiler"

    ENV["GOPATH"] = buildpath

    system "go", "get", "github.com/serulian/compiler/cmd/serulian"
    system "go", "build", "github.com/serulian/compiler/cmd/serulian"

    bin.install "serulian"
  end

  test do
    system "#{bin}/serulian", "version"
  end
end
