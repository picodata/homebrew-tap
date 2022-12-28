class Genin < Formula
  desc "Quick inventory generation for tarantool apps"
  homepage "https://github.com/picodata/genin"
  url "https://binary.picodata.io/repository/raw/genin/osx/genin-0.4.12-x86_64-macosx.tar.gz"
  sha256 "fb8bacdac9226c1ec3d3499ce559ccbbdba75f69e07e593fa93d377e20a9d33f"
  version "0.4.12"
  license "BSD-2-Clause license"

  def install
    bin.install "genin"
  end

  test do
    system "#{bin}/genin"
  end
end
