class Genin < Formula
  desc "Quick inventory generation for tarantool apps"
  homepage "https://github.com/picodata/genin"
  url "https://binary.picodata.io/repository/raw/genin/osx/genin-0.4.16-x86_64-macosx.tar.gz"
  sha256 "ee1d1fb72487d325efc7b6a89fcbf47fc3f6a59ac47ce9916cc7547058ebd80a"
  version "0.4.16"
  license "BSD-2-Clause license"

  def install
    bin.install "genin"
  end

  test do
    system "#{bin}/genin"
  end
end
