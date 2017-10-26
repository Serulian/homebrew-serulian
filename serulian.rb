class Serulian < Formula
  desc "Serulian toolkit"
  homepage "https://serulian.io"
  head "https://github.com/serulian/compiler.git"
  url "https://github.com/serulian/compiler/releases/download/v0.0.1/serulian-darwin-amd64", :using => :nounzip
  version "v0.0.1"

  bottle :unneeded
  
  def install
    system "cp", "serulian-darwin-amd64", "serulian"
    bin.install "serulian"
  end

  test do
    system "#{bin}/serulian", "version"
  end
end
