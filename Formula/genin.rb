class Genin < Formula
  desc "Quick inventory generation for tarantool apps"
  homepage "https://github.com/picodata/genin"
  url "https://binary.picodata.io/repository/raw/genin/osx/genin-0.4.9-x86_64-macosx.tar.gz"
  sha256 "dd503869a0910ce4796f72199387fec2d117aa909dd5c4bfd251f624775b7222"
  version "0.4.9"
  license "BSD-2-Clause license"

  def install
    bin.install "genin"
  end

  test do
    system "#{bin}/genin"
  end
end
