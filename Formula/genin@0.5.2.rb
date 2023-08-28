class GeninAT052 < Formula
  desc "Quick inventory generation for tarantool apps"
  homepage "https://github.com/picodata/genin"
  url "https://binary.picodata.io/repository/raw/genin/osx/genin-0.5.2-x86_64-macosx.tar.gz"
  sha256 "cf09eab628a179ccc3f548bc7b4fcfa0e4defa2ef373913a7e89dca25a65556e"
  version "0.5.2"
  license "BSD-2-Clause license"

  def install
    bin.install "genin"
  end

  test do
    system "#{bin}/genin"
  end
end
