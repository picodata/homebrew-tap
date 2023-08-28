class GeninAT055 < Formula
  desc "Quick inventory generation for tarantool apps"
  homepage "https://github.com/picodata/genin"
  url "https://binary.picodata.io/repository/raw/genin/osx/genin-0.5.5-x86_64-macosx.tar.gz"
  sha256 "c050e7fda47b2788327bd1baa28e0cadc699a7f90f952bd3f4d3d296c9221a1f"
  version "0.5.5"
  license "BSD-2-Clause license"

  def install
    bin.install "genin"
  end

  test do
    system "#{bin}/genin"
  end
end
