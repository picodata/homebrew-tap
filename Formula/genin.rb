class Genin < Formula
  desc "Quick inventory generation for tarantool apps"
  homepage "https://github.com/picodata/genin"
  url "https://binary.picodata.io/repository/raw/genin/osx/genin-0.4.20-x86_64-macosx.tar.gz"
  sha256 "02b78022dab9704b1cdd0fde65b25298b5edda0c84517bf186098b1c1723aafd"
  version "0.4.20"
  license "BSD-2-Clause license"

  def install
    bin.install "genin"
  end

  test do
    system "#{bin}/genin"
  end
end
