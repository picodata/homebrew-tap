class Genin < Formula
  desc "Quick inventory generation for tarantool apps"
  homepage "https://github.com/picodata/genin"
  url "https://binary.picodata.io/repository/raw/genin/osx/genin-0.4.15-x86_64-macosx.tar.gz"
  sha256 "dd30c27c9d88536e5f947774cc2ae13c3be1e38693a0009db3f6f69a4ff57f3c"
  version "0.4.15"
  license "BSD-2-Clause license"

  def install
    bin.install "genin"
  end

  test do
    system "#{bin}/genin"
  end
end
