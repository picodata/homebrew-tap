class Genin < Formula
  desc "Quick inventory generation for tarantool apps"
  homepage "https://github.com/picodata/genin"
  url "https://binary.picodata.io/repository/raw/genin/osx/genin-0.4.13-x86_64-macosx.tar.gz"
  sha256 "a97177d2e389fd63e194182974a31257e2525bac6a081550751fb78ec6a736ae"
  version "0.4.13"
  license "BSD-2-Clause license"

  def install
    bin.install "genin"
  end

  test do
    system "#{bin}/genin"
  end
end
