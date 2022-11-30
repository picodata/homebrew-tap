class Genin < Formula
  desc "Quick inventory generation for tarantool apps"
  homepage "https://github.com/picodata/genin"
  url "https://binary.picodata.io/repository/raw/genin/osx/genin-0.4.10-x86_64-macosx.tar.gz"
  sha256 "9a1ea5ae205a90e334c710a1f318e40a1ad1c556dbaf3a360df1910b0ee7199c"
  version "0.4.10"
  license "BSD-2-Clause license"

  def install
    bin.install "genin"
  end

  test do
    system "#{bin}/genin"
  end
end
