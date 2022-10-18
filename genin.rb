class Genin < Formula
  desc "Quick inventory generation for tarantool apps"
  homepage "https://github.com/picodata/genin"
  url "https://binary.picodata.io/repository/raw/genin/osx/genin-0.3.8-x86_64-macosx.tar.gz"
  sha256 "ca769f53e8cf85b335f34ed5f678dfdddac0cef85009c1ca249856da8cfcf680"
  license "BSD-2-Clause license"

  def install
    bin.install "genin"
  end

  test do
    system "#{bin}/genin"
  end
end
