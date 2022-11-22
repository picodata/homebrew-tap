class Genin < Formula
  desc "Quick inventory generation for tarantool apps"
  homepage "https://github.com/picodata/genin"
  url "https://binary.picodata.io/repository/raw/genin/osx/genin-0.4.6-x86_64-macosx.tar.gz"
  sha256 "e85c9967a3d5b9d15419f4db5cf754180fd15306536eab97bc9e19f5c3989684"
  version "0.4.6"
  license "BSD-2-Clause license"

  def install
    bin.install "genin"
  end

  test do
    system "#{bin}/genin"
  end
end
