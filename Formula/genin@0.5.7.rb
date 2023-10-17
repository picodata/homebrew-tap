class GeninAT057 < Formula
  desc "Quick inventory generation for tarantool apps"
  homepage "https://github.com/picodata/genin"
  url "https://binary.picodata.io/repository/raw/genin/osx/genin-0.5.7-x86_64-macosx.tar.gz"
  sha256 "574e87c14f0f606e80e9137e0d4844eeda1907367625ec55c9ee2e194a002779"
  version "0.5.7"
  license "BSD-2-Clause license"

  def install
    bin.install "genin"
  end

  test do
    system "#{bin}/genin"
  end
end
