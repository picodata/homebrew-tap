class Genin < Formula
  desc "Quick inventory generation for tarantool apps"
  homepage "https://github.com/picodata/genin"
  url "https://binary.picodata.io/repository/raw/genin/osx/genin-0.4.1-x86_64-macosx.tar.gz"
  sha256 "466568240fc7c079636dc68f65070ed66e3c3e9196940e052ad5cf67a9a7cb2a"
  version "0.4.1"
  license "BSD-2-Clause license"

  def install
    bin.install "genin"
  end

  test do
    system "#{bin}/genin"
  end
end
