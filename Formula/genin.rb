class Genin < Formula
  desc "Quick inventory generation for tarantool apps"
  homepage "https://github.com/picodata/genin"
  url "https://binary.picodata.io/repository/raw/genin/osx/genin-0.4.1-x86_64-macosx.tar.gz"
  sha256 "28f82c4a4f27a9b24fc45e3c67ab01028b3a3f94bf47d0bf6708a7c86ab9527e"
  version "0.4.1"
  license "BSD-2-Clause license"

  def install
    bin.install "genin"
  end

  test do
    system "#{bin}/genin"
  end
end
