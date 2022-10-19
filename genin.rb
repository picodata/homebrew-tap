class Genin < Formula
  desc "Quick inventory generation for tarantool apps"
  homepage "https://github.com/picodata/genin"
  url "https://binary.picodata.io/repository/raw/genin/osx/genin-0.3.8-x86_64-macosx.tar.gz"
  sha256 "ebc7f7aa69a6f3847589defb089671e04b68ee25cb80ed68a52b1646c06854ee"
  license "BSD-2-Clause license"

  def install
    bin.install "genin"
  end

  test do
    system "#{bin}/genin"
  end
end
