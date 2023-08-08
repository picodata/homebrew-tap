class GeninAT038 < Formula
  desc "Quick inventory generation for tarantool apps"
  homepage "https://github.com/picodata/genin"
  url "https://binary.picodata.io/repository/raw/genin/osx/genin-0.4.21~rc-x86_64-macosx.tar.gz"
  sha256 "e1085fbd5c1fb397583d011e680670aa95077492c69aa9865459a865a76b461a"
  version "0.4.21"
  license "BSD-2-Clause license"

  def install
    bin.install "genin"
  end

  test do
    system "#{bin}/genin"
  end
end
