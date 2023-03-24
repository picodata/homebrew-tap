class Genin < Formula
  desc "Quick inventory generation for tarantool apps"
  homepage "https://github.com/picodata/genin"
  url "https://binary.picodata.io/repository/raw/genin/osx/genin-0.4.14-x86_64-macosx.tar.gz"
  sha256 "3b5c73f57cf785408c8d7768be4d8eb7d56cf51b47f99a82280d5e0c12b6c9ad"
  version "0.4.14"
  license "BSD-2-Clause license"

  def install
    bin.install "genin"
  end

  test do
    system "#{bin}/genin"
  end
end
