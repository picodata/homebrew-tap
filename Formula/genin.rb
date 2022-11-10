class Genin < Formula
  desc "Quick inventory generation for tarantool apps"
  homepage "https://github.com/picodata/genin"
  url "https://binary.picodata.io/repository/raw/genin/osx/genin-0.4.1-x86_64-macosx.tar.gz"
  sha256 "15ac581d3f658b63b4d746775edfb0777e6867e75b0b08c89e21800695ba12a9"
  version "0.4.1"
  license "BSD-2-Clause license"

  def install
    bin.install "genin"
  end

  test do
    system "#{bin}/genin"
  end
end
