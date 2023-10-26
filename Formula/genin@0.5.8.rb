class GeninAT058 < Formula
  desc "Quick inventory generation for tarantool apps"
  homepage "https://github.com/picodata/genin"
  url "https://binary.picodata.io/repository/raw/genin/osx/genin-0.5.8-x86_64-macosx.tar.gz"
  sha256 "bf5300c9c60a72a754eaf1e2ffda95981f676cae71b30cd44c04087bca5fd465"
  version "0.5.8"
  license "BSD-2-Clause license"

  def install
    bin.install "genin"
  end

  test do
    system "#{bin}/genin"
  end
end
