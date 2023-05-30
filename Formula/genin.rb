class Genin < Formula
  desc "Quick inventory generation for tarantool apps"
  homepage "https://github.com/picodata/genin"
  url "https://binary.picodata.io/repository/raw/genin/osx/genin-0.4.19-x86_64-macosx.tar.gz"
  sha256 "d85f4c5f94fe6df48e2b4951d86a8dac30c28f1d70502ea5a6ac1510e81694d2"
  version "0.4.19"
  license "BSD-2-Clause license"

  def install
    bin.install "genin"
  end

  test do
    system "#{bin}/genin"
  end
end
