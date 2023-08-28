class Genin < Formula
  desc "Quick inventory generation for tarantool apps"
  homepage "https://github.com/picodata/genin"
  url "https://binary.picodata.io/repository/raw/genin/osx/genin-0.5.5-x86_64-macosx.tar.gz"
  sha256 "37b7fa8a98a4cfb83432efe0a11be8ce918eb409207df4a88ab611a9c10d1138"
  version "0.5.5"
  license "BSD-2-Clause license"

  def install
    bin.install "genin"
  end

  test do
    system "#{bin}/genin"
  end
end
