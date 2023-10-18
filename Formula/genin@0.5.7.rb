class GeninAT057 < Formula
  desc "Quick inventory generation for tarantool apps"
  homepage "https://github.com/picodata/genin"
  url "https://binary.picodata.io/repository/raw/genin/osx/genin-0.5.7-x86_64-macosx.tar.gz"
  sha256 "b295846ef8b4765583327dfc19b3989693d665b209638f06c27c99c7d8b6da55"
  version "0.5.7"
  license "BSD-2-Clause license"

  def install
    bin.install "genin"
  end

  test do
    system "#{bin}/genin"
  end
end
